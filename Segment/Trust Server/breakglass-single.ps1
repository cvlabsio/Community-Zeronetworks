$AssetFQDN = "test.computer.com"
$Credential = Get-Credential
$ps = New-PSSession -ComputerName $AssetFQDN -Credential $Credential -Authentication Kerberos -ErrorAction SilentlyContinue -ErrorVariable errmsg

Invoke-Command -Session $ps -Scriptblock { netsh advfirewall firewall add rule name="Zero Networks Break Glass Inbound Allow All" dir=in action=allow protocol=any } -ErrorAction Stop -ErrorVariable errmsg | Out-Null
## UNCOMMENT for RDP Only, make sure to comment out line above.
#Invoke-Command -Session $ps -Scriptblock { netsh advfirewall firewall add rule name="Zero Networks Break Glass Inbound Allow RDP" dir=in action=allow protocol=TCP localport=3389 } -ErrorAction Stop -ErrorVariable errmsg | Out-Null

Invoke-Command -Session $ps -Scriptblock { netsh advfirewall firewall add rule name="Zero Networks Break Glass Outbound Allow All" dir=out action=allow protocol=any } -ErrorAction Stop -ErrorVariable errmsg | Out-Null
