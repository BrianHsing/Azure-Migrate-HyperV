New-VMSwitch -Name "InternalNAT" -SwitchType Internal
$adapter = Get-NetAdapter -Name "vEthernet (InternalNAT)"
New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex $adapter.InterfaceIndex
New-NetNat -Name "InternalNat" -InternalIPInterfaceAddressPrefix 192.168.0.0/24