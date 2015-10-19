﻿# Enforce WorkingDir
#--------------------------------------------------
$Script:ScriptDir = Split-Path -Path $MyInvocation.MyCommand.Path -parent
Set-Location $ScriptDir

$testFile = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
# functions and tests stored in separate directories; adjusting dot-sourcing
. "$($ScriptDir -replace 'Tests', 'Functions')\$testFile"

Describe "Out-IniFile" {

    Context "Alias" {

        # assert
        It "Out-IniFile alias should exist" {
            (Get-Alias -Definition Out-IniFile).name | Should Be "set-ini"
        }

    }

}