Set-Location $PSScriptRoot

$Config = Get-Content .\config.json | ConvertFrom-Json -Depth 3

foreach ($Folder in (Get-ChildItem -Path ".\Devices" -Directory)) {
  $Nr = $Folder.BaseName
  $Ip = "$($Config.Subnet).$Nr"
  $Result = (New-Object System.Net.NetworkInformation.Ping).Send($Ip, 1000)

  if ( $Result.Status -eq 'Success') {
    Write-Host -ForegroundColor DarkGreen "$Ip online"
    if (Test-Path -Path ".\Devices\$Nr") {
      if (Test-Path -Path ".\Devices\$Nr\presets.json") {
        Copy-Item -Path ".\Devices\$Nr\presets.json" -Destination ".\Devices\$Nr\presets_last.json"
      }
      if (Test-Path -Path ".\Devices\$Nr\cfg.json") {
        Copy-Item -Path ".\Devices\$Nr\cfg.json" -Destination ".\Devices\$Nr\cfg_last.json"
      }
      try {
        Invoke-RestMethod -Uri "http://$Ip/cfg.json" -Method Get | ConvertTo-Json -Depth 5 > ".\Devices\$Nr\cfg.json"
        Invoke-RestMethod -Uri "http://$Ip/presets.json" -Method Get | ConvertTo-Json  -Depth 5 > ".\Devices\$Nr\presets.json"
      }
      catch {
        $_
      }
    }
  }
}
