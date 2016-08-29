Function ConvertTo-Bat
{
<#
.SYNOPSIS
Takes input of a .ps1 file and converts it to a base64 encoded .bat powershell command.
.DESCRIPTION

#>

param
    (
    [parameter(Mandatory=$true)]
    [string]
    $pathToPs1,
    [parameter(Mandatory=$true)]
    [string]
    $pathToOutput 
    )

$code = Get-Command $pathToPs1 |select -ExpandProperty ScriptBlock

$Base64 = [convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($code))

"@PowerShell -EncodedCommand $Base64" |Out-File -Encoding ascii -FilePath $pathToOutput

}