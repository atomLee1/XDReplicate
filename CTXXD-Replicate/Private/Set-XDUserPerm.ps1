function Set-XDUserPerm
{
<#
.SYNOPSIS
    Sets user permissions on desktop
.DESCRIPTION
    Sets user permissions on desktop
.PARAMETER APP
    Exported desktop object
.PARAMETER XDHOST
    XenDesktop DDC hostname to connect to
#>
[cmdletbinding(SupportsShouldProcess = $true, ConfirmImpact='Low')]
Param (
[Parameter(Mandatory=$true)]$desktop, 
[Parameter(Mandatory=$true)][string]$xdhost)
    
    Write-Verbose "BEGIN: $($MyInvocation.MyCommand)"
    if ($PSCmdlet.ShouldProcess("User Permissions")) { 
        if ($desktop.IncludedUserFilterEnabled)
        {
            Set-BrokerEntitlementPolicyRule -AdminAddress $xdhost -AddIncludedUsers $desktop.includedusers -Name $desktop.Name
        }

        if ($desktop.ExcludedUserFilterEnabled)
        {
            Set-BrokerEntitlementPolicyRule -AdminAddress $xdhost -AddExcludedUsers $desktop.excludedusers -Name $desktop.Name
        }
    }
    Write-Verbose "END: $($MyInvocation.MyCommand)"
}
