$DebloatFolder = "C:\ProgramData\Debloat"
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
}
Else {
    Write-Output "The folder '$DebloatFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$DebloatFolder" -ItemType Directory
    Write-Output "The folder $DebloatFolder was successfully created."
}

$templateFilePath = "C:\ProgramData\Debloat\removebloat.ps1"

Invoke-WebRequest `
-Uri "https://raw.githubusercontent.com/andrew-s-taylor/public/main/De-Bloat/RemoveBloat.ps1" `
-OutFile $templateFilePath `
-UseBasicParsing `
-Headers @{"Cache-Control"="no-cache"}


# Remove Amazon 
Remove-Item -Path "C:\Program Files (x86)\Online Services\Amazon" -Recurse
Remove-Item -Path "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Amazon.com.lnk" -Recurse

# Remove Adobe Offers
Remove-Item -Path "C:\Program Files (x86)\Online Services\Adobe" -Recurse
Remove-Item -Path "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe offers.lnk" -Recurse

# Remove TCO-Certified
Remove-Item -Path "C:\ProgramData\HP\TCO" -Recurse
Remove-Item -Path "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\TCO Certified.lnk" -Recurse

#Remove MS Edge from Desktop
Remove-Item -Path "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" -Recurse
Remove-Item -Path "c:\Users\Public\Desktop\Microsoft Edge.lnk" -Recurse

#Remove Chat feature
Get-AppxPackage MicrosoftTeams* | Remove-AppxPackage

invoke-expression -Command $templateFilePath
