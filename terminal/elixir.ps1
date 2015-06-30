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
    public string Description;
    public string Name;    
    public string AdditionalArgs;
    public string MultipleArgs;
}
'@

$versionOption = New-Object option
$versionOption.Name = "-v"
$versionOption.AdditionalArgs = ""
$versionOption.Description = "Prints version and exit"
$versionOption.MultipleArgs = "No"

$evaluateOption = New-Object option
$evaluateOption.Name = "-e"
$evaluateOption.AdditionalArgs = "command"
$evaluateOption.Description = "Evaluates the given command"
$evaluateOption.MultipleArgs = "Yes"

$requireOption = New-Object option
$requireOption.Name = "-r"
$requireOption.AdditionalArgs = "file"
$requireOption.Description = "Requires the given files/patterns"
$requireOption.MultipleArgs = "Yes"

$scriptOption = New-Object option
$scriptOption.Name = "-S"
$scriptOption.additionalArgs = "Script"
$scriptOption.Description = "Runs the specified script"
$scriptOption.MultipleArgs = "No"

$pRequireOption = New-Object option
$pRequireOption.Name = "-pr"
$pRequireOption.AdditionalArgs = "file"
$pRequireOption.Description = "Requires the given files/patterns in parallel"
$pRequireOption.MultipleArgs = "Yes"

[option[]] $optionArray = $versionOption, $evaluateOption, $requireOption, $scriptOption, $pRequireOption

function DisplayHelp
{
    $scriptName = GetScriptName
    Write-Output $scriptName
    Write-Output "Usage:"
    foreach ($option in $optionArray)
    {
        Write-Output $option
    }
}

function GetScriptName
{
    split-path $MyInvocation.PSCommandPath -Leaf
}

if ($args.Count -eq 0)
{
    DisplayHelp
}
