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

foreach ($Device in $Devices) {
  function GetDeviceState ($Ip) {
    $Result = Invoke-RestMethod -Uri "http://$Ip/json/state"
    return $Result
  }
}

function Set-State {
  [CmdletBinding()]
  param (
    # Ip
    [Parameter(Mandatory)]
    [ipaddress]
    $Ip,
    # State
    [Parameter(Mandatory)]
    [ParameterType]
    $ParameterName
  )

  begin {

  }

  process {

  }

  end {

  }
}

function SetState ($Ip, $State) {
  Invoke-RestMethod -Uri "http://$Ip/json/state" -Method POST -Body $State > $null
}

30..60 | ForEach-Object -Parallel {
  SetState("192.168.1.$_", $State)
}


