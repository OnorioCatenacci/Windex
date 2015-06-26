param(
    [Parameter(Mandatory=$False,Position=1)]
    [string]$options,
	
    [Parameter(Mandatory=$False,Position=2)]
    [string]$scriptfile,

    [Parameter(Mandatory=$False,Position=3)]
    [string]$data
)

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

$scriptOption = New-Object option
$scriptOption.optionName = "S"
$scriptOption.additionalParams = "ScriptName"
$scriptOption.optionDescription = "Runs the specified script"

[option[]] $optionArray = $versionOption, $scriptOption



Function DisplayHelp
{
    $scriptName = split-path $MyInvocation.PSCommandPath -Leaf
    Write-Host $scriptName
    Write-Host "Usage:"
    foreach ($option in $optionArray)
    {
        Write-Host $option.optionName,  $option.additionalParams,  $option.optionDescription
    }
}
    
if ($args.Count -eq 0)
{
    DisplayHelp
}
