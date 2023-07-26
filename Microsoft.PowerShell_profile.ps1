using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module PSColor
# Only run this in the console and not in the ISE
Import-Module Get-ChildItemColor


# https://news.ycombinator.com/item?id=12991690

$PSDefaultParameterValues = @{
  '*:autosize'        = $true
  'Receive-Job:keep'  = $true
  '*:Wrap'            = $true
  'Out-File:Encoding' = 'utf8'
}

# Proper history etc
# https://technet.microsoft.com/en-us/magazine/hh241048.aspx
$MaximumHistoryCount = 10000

# Change how powershell does tab completion
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

function grep($regex, $dir) {
  if ( $dir ) {
    Get-ChildItem $dir | Select-String $regex
    return
  }
  $input | Select-String $regex
}
function cut() {
  foreach ($part in $input) {
    $line = $part.ToString();
    $MaxLength = [System.Math]::Min(200, $line.Length)
    $line.subString(0, $MaxLength)
  }
}
function UpDir () {

  Set-Location -Path ..

}
function NewLs () {
  C:\Users\lachim\scoop\shims\lsd.EXE -lhA
}
function NewTree () {
  C:\Users\lachim\scoop\shims\lsd.EXE -lhA --tree
}

# Node
Set-Alias -Name 'ls' -Value 'NewLs'
Set-Alias -Name 'l' -Value 'NewLs'
Set-Alias -Name 'll' -Value 'NewLs'
Set-Alias -Name '..' -Value 'UpDir'
Set-Alias -Name 'tree' -Value 'NewTree'


# `ForwardChar` accepts the entire suggestion text when the cursor is at the end of the line.
#  This custom binding makes `RightArrow` behave similarly - accepting the next word instead of the entire suggestion text.
Set-PSReadLineKeyHandler -Key RightArrow `
  -BriefDescription ForwardCharAndAcceptNextSuggestionWord `
  -LongDescription "Move cursor one character to the right in the current editing line and accept the next word in suggestion when it's at the end of current editing line" `
  -ScriptBlock {
  param($key, $arg)
  $line = $null
  $cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
  if ($cursor -lt $line.Length) {
    [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
  } else {
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
  }
}


Invoke-Expression (&starship init powershell)

