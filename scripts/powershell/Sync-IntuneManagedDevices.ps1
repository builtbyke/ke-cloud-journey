<#
.SYNOPSIS
    Exports managed Intune devices to a CSV and performs a sync on each device

.NOTES
The below modules need to be installed in order to run this script:

1. Install-Module -Name Microsoft.Graph
2. Install-Module -Name ImportExcel

Make sure you are connected to Microsoft Graph, if not, use this command and authenticate:

** Connect-MgGraph -Scopes "DeviceManagementManagedDevices.PrivilegedOperations.All" **
#>

Get-MgDeviceManagementManagedDevice | Export-Csv -Path 'path'

$pathToCsv = 'path'
$file = Import-Csv -Path $pathToCsv | Select 'Id'

foreach ($row in $file) {

    Write-Host "Attempting sync on device with ID: $($row.Id)" -ForegroundColor Green
    Sync-MgDeviceManagementManagedDevice -ManagedDeviceId $row.Id

try {
    Sync-MgDeviceManagementManagedDevice -ManagedDeviceId $row.Id -ErrorAction Stop
    Write-Host "This device was successfully synced" -ForegroundColor Green

} 
catch {
    Write-Host "Could not sync device $($row.Id), please try again" -ForegroundColor Yellow
}
}
