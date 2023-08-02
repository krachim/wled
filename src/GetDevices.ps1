Set-Location $PSScriptRoot
$Devices = [System.Collections.Generic.List[Object]]

function GetDevices () {
  30..60 | ForEach-Object {
    Write-Host -NoNewline -ForegroundColor DarkYellow "192.168.1.$_ online"
    try {
      $Result = Invoke-RestMethod -Uri "http://192.168.1.$_/json/info"
      $Devices.Add($Result)
      $Result | ConvertTo-Json -Depth 6 > ".\Devices\$($Result.ip).json"
    } catch {
      throw
    }
  }
}
