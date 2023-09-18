$DebloatFolder = "C:\ProgramData\Debloat"
If (Test-Path $DebloatFolder) {
}
Else {
    Start-Sleep 1
    New-Item -Path "$DebloatFolder" -ItemType Directory
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

#Remove MS Edge from Desktop and Start-Menu
Remove-Item -Path "c:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" -Recurse
Remove-Item -Path "c:\Users\Public\Desktop\Microsoft Edge.lnk" -Recurse
Remove-Item -Path "C:\Users\$($ENV:USERNAME)\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" -Recurse

#Remove Chat feature
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v TaskbarMn /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /f /v ChatIcon /t REG_DWORD /d 3

invoke-expression -Command $templateFilePath
