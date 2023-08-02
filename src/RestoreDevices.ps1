Set-Location $PSScriptRoot

$Folders = Get-ChildItem -Path ".\Devices" -Directory

foreach ($Folder in $Folders) {
  $Nr = $Folder.BaseName
  $Ip = "192.168.1.$Nr"
  $Result = (New-Object System.Net.NetworkInformation.Ping).Send($Ip, 1000)


  if ( $Result.Status -eq 'Success') {
    Write-Host -ForegroundColor DarkGreen "$Ip online"
    if (Test-Path -Path ".\Devices\$Nr") {

      try {
        $Form = @{
          name  = 'data'
          filename   = '/presets.json'
          data = Get-Item -Path ".\Devices\$Nr\presets.json"
        }
        Invoke-RestMethod -Uri "http://$Ip/upload" -Method Post -Form $Form -ContentType "application/json"
      }
      catch {
        $_
      }
    }
  }
}

