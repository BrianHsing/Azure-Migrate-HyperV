$location = "Japan East"
$resourceGroup = "serverMigrate"
New-AzResourceGroup -Name "azureMigrateTool" -Location $location
New-AzResourceGroup -Name $resourceGroup -Location $location

#建立遷移後的Public IP
New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location $location `
  -Name linux-ap-pip -AllocationMethod Static -Sku Standard

New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location $location `
  -Name win2k16-ap-pip -AllocationMethod Static -Sku Standard

#建立網路安全性群組允許存取Http
$nsg = New-AzNetworkSecurityGroup -Name nsg -ResourceGroupName $resourceGroup -Location $location
Get-AzNetworkSecurityGroup -Name nsg -ResourceGroupName $resourceGroup | Add-AzNetworkSecurityRuleConfig -Name AllowHttp `
-Description "Allow Http" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
-SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80  | Set-AzNetworkSecurityGroup

#建立遷移後的虛擬網路
$virtualNetwork = New-AzVirtualNetwork `
    -ResourceGroupName $resourceGroup `
    -Location $location `
    -Name vNet `
    -AddressPrefix 192.168.0.0/24
$subnetWorkload = Add-AzVirtualNetworkSubnetConfig `
    -Name subnet `
    -AddressPrefix 192.168.0.0/24 `
    -VirtualNetwork $virtualNetwork `
    -NetworkSecurityGroup $nsg
$virtualNetwork | Set-AzVirtualNetwork


