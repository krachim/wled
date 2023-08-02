Set-Location $PSScriptRoot

$Config = Get-Content .\config.json | ConvertFrom-Json -Depth 3

36..38 | ForEach-Object {
  $Ip = "$($Config.Subnet).$_"
  $Result = (New-Object System.Net.NetworkInformation.Ping).Send($Ip, 1000)
  if ( $Result.Status -eq 'Success') {
    Write-Host -ForegroundColor DarkGreen "$Ip online"
    if (Test-Path -Path ".\Devices\$_") {
      continue
    } else {
      mkdir ".\Devices\$_"
    }
  }
}
