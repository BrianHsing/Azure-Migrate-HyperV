# Azure Migrate

## Server Migrate
 - Migrate Hyper-V VMs<br>
	- [Azure Migration : 伺服器移轉工具， 將 Hyper-V VM 遷移至 Azure](https://github.com/BrianHsing/Azure-Migrate/tree/master/hyper-v)<br>
 - Migrate VMware VMs<br>
	- 使用無代理程式
		- VMWare vCenter 是必要<br>
		- 使用 Azure Migrate：伺服器評量，佈署設備，評定、複寫、移轉 VMs<br>
	- 以代理程式為基礎
		- VMWare vCenter 非必要<br>
		- 使用 Azure Migrate：伺服器移轉，佈署複寫設備，在每台需要移轉的 VMs 中安裝代理程式，進行複寫、移轉<br>
 - Migrate AWS VMs<br>