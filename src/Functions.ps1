
function SetState ($Ip, $State) {
  Invoke-RestMethod -Uri "http://$Ip/json/state" -Method POST -Body $State > $null
}

function GetDeviceState ($Ip) {
  $Result = Invoke-RestMethod -Uri "http://$Ip/json/state"
  return $Result
}
