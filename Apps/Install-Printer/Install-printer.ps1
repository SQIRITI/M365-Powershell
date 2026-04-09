$scriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$scriptDir += "\variables.json"
$JsonObject = Get-Content $scriptDir | ConvertFrom-Json

$driverStore = "$PSScriptRoot\Drivers\"
$driverStore += $JsonObject.infFile

pnputil.exe /add-driver $driverStore

Add-PrinterDriver -Name $JsonObject.driverName

Add-PrinterPort -Name $JsonObject.portName -PrinterHostAddress $JsonObject.portAddress
Add-Printer -Name $JsonObject.printerName -DriverName $JsonObject.driverName -PortName $JsonObject.portName