$DebloatFolder = "C:\ProgramData\Debloat"
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
    New-Item C:\DebloatFolderExists.txt
}
Else {
    New-Item C:\BeginningDebloatFolderCreation.txt
    Write-Output "The folder '$DebloatFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$DebloatFolder" -ItemType Directory
    Write-Output "The folder $DebloatFolder was successfully created."
    New-Item C:\DebloatFolderCreationSuccessful.txt
}

$templateFilePath = "C:\ProgramData\Debloat\removebloat.ps1"

New-Item C:\BeginningPowershellDownload.txt

Invoke-WebRequest `
-Uri "https://raw.githubusercontent.com/andrew-s-taylor/public/main/De-Bloat/RemoveBloat.ps1" `
-OutFile $templateFilePath `
-UseBasicParsing `
-Headers @{"Cache-Control"="no-cache"}

New-Item C:\DownloadedPowershellSuccessful.txt

invoke-expression -Command $templateFilePath