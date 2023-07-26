Set-Location $PSScriptRoot
$Devices = [System.Collections.Generic.List[System.Object]]

140..254 | ForEach-Object {
  $Result = (New-Object System.Net.NetworkInformation.Ping).Send("192.168.1.$_", 1000)
  if ( $Result.Status -eq 'Success') {
    Write-Host -NoNewline -ForegroundColor DarkYellow "192.168.1.$_ online. Checking if Device is WLED ... "
    try {
      $Result = Invoke-RestMethod -Uri "http://192.168.1.$_/json/info" -SkipCertificateCheck -TimeoutSec 2 -DisableKeepAlive -MaximumRetryCount 0 -SkipHeaderValidation
      Write-Host -ForegroundColor DarkGreen "Si Si"
      $Devices.Add($Result)
      $Result | ConvertTo-Json -Depth 6 > ".\Devices\$($Result.ip).json"

      Write-Host "  Name = $($Result.name)"
      Write-Host "  Ip = $($Result.ip)"
      Write-Host "  Version = $($Result.ver)"
      Write-Host "  UdpPort = $($Result.udpport)"

    }
    catch {
      Write-Host -ForegroundColor DarkRed "Nope"
    }
  }
}
