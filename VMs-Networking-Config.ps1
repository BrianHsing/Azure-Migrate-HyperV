New-VMSwitch -Name "InternalNAT" -SwitchType Internal
$adapter = Get-NetAdapter -Name "vEthernet (InternalNAT)"
New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex $adapter.InterfaceIndex
New-NetNat -Name "InternalNat" -InternalIPInterfaceAddressPrefix 192.168.0.0/24
netsh advfirewall firewall add rule name="Open Port for Hyper-V" dir=in action=allow protocol=TCP localport="5985,5986"
winrm quickconfig