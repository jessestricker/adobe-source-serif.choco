$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$fontFiles = Get-ChildItem -LiteralPath $toolsDir -Filter "*.ttf" | Select-Object -ExpandProperty FullName
$installCount = Install-ChocolateyFont -Multiple -Paths $fontFiles

if ($installCount -eq 0) {
    Throw 'All font installation attempts failed!'
}
elseif ($installCount -lt $fontFiles.Count) {
    Write-Warning "$($fontFiles.Count - $installCount) fonts failed to install."
}
