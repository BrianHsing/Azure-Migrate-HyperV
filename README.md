# Azure Server Migrate on Hyper-V
 透過 Azure VM 巢狀虛擬化建立單一 Hyper-V 主機，利用 Azure Migrate 輕鬆地將虛擬機器搬遷至 Azure。<br>
 完成此 Lab 您將學會：<br>
 - 學會在 Azure 模擬內部部署 Hyper-V 環境<br>
 - 學會建立 Azure Migrate 專案
 - 學會使用 Azure Migrate Assessment Tool 參考產出的報表預估每月費用與虛擬機器規格<br>
 - 學會使用 Azure Migrate Tool 一系列的複寫、測試移轉、正式移轉等流程<br>

## 環境準備 (約30-40分鐘完成)<br>
 - Azure 訂用帳戶、Azure 訂用帳戶擁有者權限<br>
 - 下載 Single-Hyper-V.ps1<br>
	- 此命令會建立D8v3的虛擬機器、虛擬網路、堡壘<br>
 - 下載 Azure-Migrate-Basic.ps1<br>
	- 此命令會建立遷移後虛擬機器的虛擬網路、公用 IP、網路安全性群組，後續會在遷移流程中使用<br>
 - 使用 Single-Hyper-V.ps1 佈署 Hyper-V Server <br> 
	- 啟用 CloudShell<br>
    - 輸入`Connect-AzAccount` 登入<br>
	- 上傳 Single-Hyper-V.ps1<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/cloudshell-uploadps1.PNG "cloudshell-uploadps1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/upload-success.PNG "upload-succsess")
	- 輸入並執行 `./Single-Hyper-V.ps1` <br>
 - 使用 Azure-Migrate-Basic.ps1 佈署遷移基礎環境 <br> 
	- 上傳 Azure-Migrate-Basic.ps1<br>
	- 輸入並執行 `./Azure-Migrate-Basic.ps1` <br>
 - 設定客體虛擬機器的網際網路連線<br>
	- 進入 Azure Portal，選擇虛擬機器 hyperv，使用 Bastion 連線 (hyadmin/hyadmin@123) <br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/connect-vm-with-bastion.PNG "connect-vm-with-bastion")
	- 開啟 `VMs-Networking-Config.ps1` 並全選複製指令 <br>
	- 開啟 Powershell 貼上指令執行
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/networking-setting1.PNG "networking-setting1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/networking-setting2.PNG "networking-setting2")
 - 在虛擬機器 hyperv 中下載 VHD <br>
	- 下載 Linux-AP 並解壓縮  https://aka.ms/vhd-linux-ap<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/Extract.PNG "Extract")
	- 下載 win2k16-AP 並解壓縮  https://aka.ms/vhd-win2k16-ap<br>
	> **Tips.建議關閉 IE Enhanced Security Configuration** <br>
 - 開啟 Hyper-V Manager
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/open-hyper-v-manamge-import.PNG "open-hyper-v-manamge-import")	
 - 選擇 Import Virtual Machine 匯入 Linux Server (isadmin/isadmin@123)<br>
 	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import1.PNG "import1")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import2.PNG "import2")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import3.PNG "import3")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import4.PNG "import4")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import5.PNG "import5")	
 - 選擇 Import Virtual Machine 匯入 Windows Server (administrator/isadmin@123)<br>
	- 如上述步驟一致，只要改選擇win2k16-ap資料夾即可<br>
 - 前置環境作業完成<br>
  	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completeImport.PNG "completeImport")	
 	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completeImportAP.PNG "completeImportAP")	


## 遷移流程 <br>
 - 建立 Azure Migrate<br>
	- 進入 Azure Migrate 選擇移轉目標為伺服器，點選新增工具
 	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/Create-Migrate-Tool.PNG "Create-Migrate-Tool")	
 	- 新增移轉專案 AzureMigrateProject 地理選擇日本
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addMigrateProject.PNG "addMigrateProject")	
	- 選擇 Azure Migrate: Server Assessment
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addassessment.PNG "addassessment")	
 	- 選擇 Azure Migrate: Server Migration
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addMigrateTool.PNG "addMigrateTool")	
 	- 檢閱無誤後，點選新增工具
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addcomplete.PNG "addcomplete")	
 - 準備評估 Hyper-V VM<br>
 - 準備遷移 Hyper-V VM<br>

