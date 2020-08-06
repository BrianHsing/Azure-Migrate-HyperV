# Azure Server Migrate on Hyper-V
 透過Azure VM巢狀虛擬化建立單一Hyper-V主機，利用Azure Migrate輕鬆地將虛擬機器搬遷至Azure。

## 環境準備<br>
 - Azure 訂用帳戶、Azure 訂用帳戶擁有者權限<br>
 - 下載 Single-Hyper-V.ps1<br>
 - 使用 Single-Hyper-V.ps1 佈署 Hyper-V Server (10分鐘)<br> 
	- 啟用 CloudShell<br>
    - 輸入`Connect-AzAccount` 登入<br>
	- 上傳 Single-Hyper-V.ps1<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/cloudshell-uploadps1.PNG "cloudshell-uploadps1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/upload-success.PNG "upload-succsess")
	- 輸入並執行 `./Single-Hyper-V.ps1` <br>
 - 設定客體虛擬機器的網際網路連線 (5分鐘)<br>
	- 進入 Azure Portal，選擇虛擬機器 hyperv，使用 Bastion 連線 (hyadmin/hyadmin@123) <br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/connect-vm-with-bastion.PNG "connect-vm-with-bastion")
	- 開啟 `VMs-Networking-Config.ps1` 並全選複製指令 <br>
	- 開啟 Powershell 貼上指令執行
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/networking-setting1.PNG "networking-setting1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/networking-setting2.PNG "networking-setting2")
 - 在虛擬機器 hyperv 中下載 VHD (5分鐘)<br>
	- 下載 Linux-AP 並解壓縮  https://aka.ms/vhd-linux-ap<br>
	- 下載 win2k16-AP 並解壓縮  https://aka.ms/vhd-win2k16-ap<br>
	> **Tips.建議關閉 IE Enhanced Security Configuration** <br>
 - 開啟 Hyper-V Manager
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/open-hyper-v-manamge-import.PNG "open-hyper-v-manamge-import")	
 - 選擇 Import Virtual Machine 匯入 Linux Server<br>
 	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import1.PNG "import1")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import2.PNG "import2")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import3.PNG "import3")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import4.PNG "import4")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import5.PNG "import5")	
 - 選擇 Import Virtual Machine 匯入 Windows Server<br>
	- 如上述步驟一致，只要改選擇win2k16-ap資料夾即可<br>
 - 前置環境作業完成<br>

<h1>遷移流程</h1><br>
 - 建立 Azure Migrate<br>
 - 準備評估 Hyper-V VM<br>
 - 準備遷移 Hyper-V VM<br>

