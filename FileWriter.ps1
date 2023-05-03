<#######################################################################################>
<# Author : Christopher Roelle
<# Date   : 05-03-2023
<# Purpose: Link the file for writing to files functionality.
<#          Link the file using . 'path\FileWriter.ps1'
<#######################################################################################>

#We are linked.
Write-Output('Linked FileWriter.ps1.')

#Writes line to file. If file doesn't exist, adds the file.
function WriteToFile{

    param(
        $Path,
        $Filename,
        $Line
    )

    Write-Output("Checking if file exists...")
    if(!(Test-Path($Path + $Filename))){
        Write-Output('')
        Write-Output("File doesn't exist, writing file.")
        New-Item -Path $Path -Name $Filename
        Write-Output('')
    }
    Write-Output("File exists!")

    $fullName = $Path + '\' + $Filename

    Add-Content -Path $fullName -Value $Line
}

#Useful for deleting the existing file.
function DeleteExistingFile{

    param(
        $Path,
        $Filename
    )

    Write-Output("Checking if file exists...")

    if(!(Test-Path($Path + $Filename))){
        Write-Output('')
        Write-Output("File doesn't exist, skipping.")
        Write-Output('')
    }
    else{
        Write-Output("File exists. Deleting...")

        $fullName = $Path + '\' + $Filename

        Remove-Item -Path $fullName

        Write-Output($fullname + " was deleted.")
    }

}

#Clears the contents of the file. Sets contents to blank.
function ClearFileContents{
    param(
        $Path,
        $Filename
    )

    Write-Output("Checking if file exists...")

    if(!(Test-Path($Path + $Filename))){
        Write-Output('')
        Write-Output("File doesn't exist, skipping.")
        Write-Output('')
    }
    else{
        Write-Output("File exists. Clearing contents...")

        $fullName = $Path + '\' + $Filename

        Set-Content -Path $fullName -Value ""

        Write-Output($fullname + " contents cleared.")
    }
}