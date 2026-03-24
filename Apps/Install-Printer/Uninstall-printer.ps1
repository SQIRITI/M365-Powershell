$scriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$scriptDir += "\variables.json"
$JsonObject = Get-Content $scriptDir | ConvertFrom-Json

Remove-Printer -Name $JsonObject.printerName
Remove-PrinterPort -Name $JsonObject.portName
Remove-PrinterDriver -name $JsonObject.driverName

pnputil.exe /delete-driver $JsonObject.infFile