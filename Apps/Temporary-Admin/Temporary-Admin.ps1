$Modules = "$PSScriptRoot\Modules"

Import-Module -Name $Modules\BurntToast -Verbose


New-BurntToastNotification -Text "You have been granted temporary Admin access rights for 30 minutes"