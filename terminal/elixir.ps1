<#
.SYNOPSIS
   Launch Elixir
.NOTES
   AUTHOR: Onorio Catenacci catenacci@ieee.org

Version: 0.01
Date: 25 June 2015

#>

Add-Type @'
public class option
{
    public string optionName;    
    public string additionalParams;
    public string optionDescription;
}
'@

$versionOption = New-Object option
$versionOption.optionName = "v"
$versionOption.additionalParams = ""
$versionOption.optionDescription = "Prints version and exit"

[option[]] $optionArray = $versionOption

Param (
    [Parameter(Mandatory=$False,Position=1)]
    [string]$options,
	
    [Parameter(Mandatory=$False,Position=2)]
    [string]$scriptfile,

    [Parameter(Mandatory=$False,Position=3)]
    [string]$data
)


Function DisplayHelp
{
    foreach ($option in $optionArray)
    {
        Write-Host $option.optionName    $option.optionDescription
    }
}
    
