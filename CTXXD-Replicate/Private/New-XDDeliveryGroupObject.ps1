function New-XDDeliveryGroupObject 
{
<#
.SYNOPSIS
    Creates new Desktop Delivery Group Object script block
.DESCRIPTION
    Creates new Desktop Delivery Group Object script block and returns to be used by invoke-command
.PARAMETER DG
    New Delivery group object
.PARAMETER XDHOST
    XenDesktop DDC hostname to connect to
#>
[cmdletbinding(SupportsShouldProcess = $true, ConfirmImpact='Low')]
Param(
[Parameter(Mandatory=$true)]$dg, 
[Parameter(Mandatory=$true)][string]$xdhost
)

Write-Verbose "BEGIN: $($MyInvocation.MyCommand)"
$temp = @{}
foreach($t in $dg.PSObject.Properties)
    {       
        if(-not ([string]::IsNullOrWhiteSpace($t.Value)))
        {
            switch ($t.name)
            {
            "Name" {$temp.Add("Name",$t.value)}
            "DesktopKind" {$temp.Add("DesktopKind",$t.value)}
            "AutomaticPowerOnForAssigned" {$temp.Add("AutomaticPowerOnForAssigned",$t.value)}
            "AutomaticPowerOnForAssignedDuringPeak" {$temp.Add("AutomaticPowerOnForAssignedDuringPeak",$t.value)}
            "ColorDepth" {$temp.Add("ColorDepth",$t.value)}
            "DeliveryType" {$temp.Add("DeliveryType",$t.value)}
            "Description" {$temp.Add("Description",$t.value)}
            "Enabled" {$temp.Add("Enabled",$t.value)}
            "InMaintenanceMode" {$temp.Add("InMaintenanceMode",$t.value)}
            "IsRemotePC" {$temp.Add("IsRemotePC",$t.value)}
            "MinimumFunctionalLevel" {$temp.Add("MinimumFunctionalLevel",$t.value)}
            "OffPeakBufferSizePercent" {$temp.Add("OffPeakBufferSizePercent",$t.value)}
            "OffPeakDisconnectAction" {$temp.Add("OffPeakDisconnectAction",$t.value)}
            "OffPeakDisconnectTimeout" {$temp.Add("OffPeakDisconnectTimeout",$t.value)}
            "OffPeakExtendedDisconnectAction" {$temp.Add("OffPeakExtendedDisconnectAction",$t.value)}
            "OffPeakExtendedDisconnectTimeout" {$temp.Add("OffPeakExtendedDisconnectTimeout",$t.value)}
            "OffPeakLogOffAction" {$temp.Add("OffPeakLogOffAction",$t.value)}
            "OffPeakLogOffTimeout" {$temp.Add("OffPeakLogOffTimeout",$t.value)}
            "PeakBufferSizePercent" {$temp.Add("PeakBufferSizePercent",$t.value)}
            "PeakDisconnectAction" {$temp.Add("PeakDisconnectAction",$t.value)}
            "PeakDisconnectTimeout" {$temp.Add("PeakDisconnectTimeout",$t.value)}
            "PeakExtendedDisconnectAction" {$temp.Add("PeakExtendedDisconnectAction",$t.value)}
            "PeakExtendedDisconnectTimeout" {$temp.Add("PeakExtendedDisconnectTimeout",$t.value)}
            "PeakLogOffAction" {$temp.Add("PeakLogOffAction",$t.value)}
            "PeakLogOffTimeout" {$temp.Add("PeakLogOffTimeout",$t.value)}
            "ProtocolPriority" {$temp.Add("ProtocolPriority",$t.value)}
            "PublishedName" {$temp.Add("PublishedName",$t.value)}
            "SecureIcaRequired" {$temp.Add("SecureIcaRequired",$t.value)}
            "SessionSupport" {$temp.Add("SessionSupport",$t.value)}
            "ShutdownDesktopsAfterUse" {$temp.Add("ShutdownDesktopsAfterUse",$t.value)}
            "SettlementPeriodBeforeAutoShutdown" {$temp.Add("SettlementPeriodBeforeAutoShutdown",$t.value)}
            "TimeZone" {$temp.Add("TimeZone",$t.value)}
            "TurnOnAddedMachine" {$temp.Add("TurnOnAddedMachine",$t.value)}
            }
            
         }
    }
    if ($PSCmdlet.ShouldProcess("Creating Desktop Group")) {    
        try {
        $tempvar = New-BrokerDesktopGroup @temp -adminaddress $xdhost -Verbose:$VerbosePreference
        }
        catch {
            throw $_
        }
    }
    return $tempvar
    Write-Verbose "END: $($MyInvocation.MyCommand)"
}
