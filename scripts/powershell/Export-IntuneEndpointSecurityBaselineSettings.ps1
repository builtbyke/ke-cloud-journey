<#
.SYNOPSIS
    Exports Endpoint Security Templates (Settings Catalog) to JSON.
    
.DESCRIPTION
    Uses Direct Microsoft Graph API calls to capture granular setting values 
    that standard M365Documentation modules often miss.
    
.NOTES
    Requires: Microsoft.Graph.Authentication
    Endpoint: https://graph.microsoft.com/beta/deviceManagement/configurationPolicies
#>

# 1. Connect with the necessary scope
Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

# 2. Define the direct API URL for Endpoint Security/Settings Catalog
$BaseUrl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies"

Write-Host "Querying Graph API directly..." -ForegroundColor Cyan

# 3. Get the list of all policies
$Policies = Invoke-MgGraphRequest -Method GET -Uri $BaseUrl

$FinalExport = foreach ($Policy in $Policies.value) {
    $PolicyId = $Policy.id
    Write-Host "Fetching settings for: $($Policy.displayName)" -ForegroundColor Gray
    
    # 4. Query the specific settings for this policy ID directly
    $SettingsUrl = "https://graph.microsoft.com/beta/deviceManagement/configurationPolicies('$PolicyId')/settings?`$top=1000"
    $Settings = Invoke-MgGraphRequest -Method GET -Uri $SettingsUrl
    
    [PSCustomObject]@{
        PolicyName = $Policy.displayName
        PolicyId   = $PolicyId
        Settings   = $Settings.value
    }
}

# 5. Export to JSON
if ($FinalExport) {
    $FinalExport | ConvertTo-Json -Depth 10 | Out-File "C:\Exports\Direct_Graph_Baseline.json"
    Write-Host "SUCCESS! Check C:\Exports\Direct_Graph_Baseline.json" -ForegroundColor Green
} else {
    Write-Error "No data returned from API. Ensure you have Endpoint Security policies created."
}
