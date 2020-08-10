# Azure Server Migrate on Hyper-V
 透過 Azure VM 巢狀虛擬化建立單一 Hyper-V 主機，利用 Azure Migrate 輕鬆地將虛擬機器搬遷至 Azure。<br>
 您大約需要花費 75 分鐘完成此 Lab，透過手把手教學您將學會：<br>
 - 學會在 Azure 模擬內部部署 Hyper-V 環境<br>
 - 學會建立 Azure Migrate 專案<br>
 - 學會操作 Azure Migrate Assessment Tool 參考產出的報表預估每月費用與虛擬機器規格<br>
 - 學會操作 Azure Migrate Tool 一系列的複寫、測試移轉、正式移轉等流程<br>

## 環境準備 <br>
 - Azure 訂用帳戶、Azure 訂用帳戶擁有者權限<br>
 - 下載 Single-Hyper-V.ps1<br>
	- 此命令會建立 D8sv3 的虛擬機器、虛擬網路、堡壘<br>
 - 下載 Azure-Migrate-Basic.ps1<br>
	- 此命令會建立移轉後虛擬機器的虛擬網路、公用 IP、網路安全性群組，後續會在移轉流程中使用<br>
 - 使用 Single-Hyper-V.ps1 佈署 Hyper-V Server <br> 
	- 啟用 CloudShell<br>
    - 輸入`Connect-AzAccount` 登入<br>
	- 上傳 Single-Hyper-V.ps1<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/cloudshell-uploadps1.PNG "cloudshell-uploadps1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/upload-success.PNG "upload-succsess")
	- 輸入並執行 `./Single-Hyper-V.ps1` <br>
 - 使用 Azure-Migrate-Basic.ps1 佈署移轉基礎環境 <br> 
	- 上傳 Azure-Migrate-Basic.ps1<br>
	- 輸入並執行 `./Azure-Migrate-Basic.ps1` <br>
 - 設定客體虛擬機器的網際網路連線<br>
	- 進入 Azure Portal，選擇虛擬機器 hyperv，使用 Bastion 連線 (hyadmin/hyadmin@1234) <br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/connect-vm-with-bastion.PNG "connect-vm-with-bastion")
	- 開啟 `VMs-Networking-Config.ps1` 並全選複製指令 <br>
	- 開啟 Powershell 貼上指令執行<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/networking-setting1.PNG "networking-setting1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/networking-setting2.PNG "networking-setting2")
 - 在虛擬機器 hyperv 中下載 VHD <br>
	- 下載 Linux-AP 並解壓縮  https://aka.ms/vhd-linux-ap<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/Extract.PNG "Extract")
	- 下載 win2k16-AP 並解壓縮  https://aka.ms/vhd-win2k16-ap<br>
	> **Tips.建議關閉 IE Enhanced Security Configuration** <br>
 - 開啟 Hyper-V Manager<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/open-hyper-v-manamge-import.PNG "open-hyper-v-manamge-import")	
 - 選擇 Import Virtual Machine 匯入 Linux Server (isadmin/isadmin@123)<br>
 	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import1.PNG "import1")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import2.PNG "import2")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import3.PNG "import3")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import4.PNG "import4")	
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/import5.PNG "import5")	
 - 選擇 Import Virtual Machine 匯入 Windows Server (administrator/isadmin@123)<br>
	- 如上述步驟一致，只要改選擇 win2k16-ap 資料夾即可<br>
 - 前置環境作業完成<br>
  	- 確認已建立兩台 VM<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completeImport.PNG "completeImport")	
 	- 確認能正常顯示 Apache (192.168.0.4)、IIS Web (192.168.0.5)<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completeImportAP.PNG "completeImportAP")	


## 移轉流程 <br>
 - 建立 Azure Migrate<br>
	- 進入 Azure Migrate 選擇移轉目標為伺服器，點選新增工具<br>
 	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/Create-Migrate-Tool.PNG "Create-Migrate-Tool")	
 	- 新增移轉專案 AzureMigrateProject 地理選擇日本<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addMigrateProject.PNG "addMigrateProject")	
	- 選擇 Azure Migrate: Server Assessment<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addassessment.PNG "addassessment")	
 	- 選擇 Azure Migrate: Server Migration<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addMigrateTool.PNG "addMigrateTool")	
 	- 檢閱無誤後，點選新增工具建立<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addcomplete.PNG "addcomplete")
	
 - 準備評估 Hyper-V VM<br>
	- 點選「發現」<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/discovery.PNG "discovery")
	- 選擇「是，使用 Hyper-V」，點選「下載」.VHD檔案<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/selectHypervanddownload.PNG "selectHypervanddownload")
	- 解壓縮 AzureMigrateAppliance.zip，在 Hyper-V Manager 選擇 Import Virtual Machine 匯入<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/importama1.PNG "importama1")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/importama2.PNG "importama2")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/importama3.PNG "importama3")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/importama4.PNG "importama4")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/importama5.PNG "importama5")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completeimportama.PNG "completeimportama")
	- 初始化設定 AzureMigrateAppliance_v3.20.05.27 (administrator/isadmin@123)<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/licenseTerms.PNG "licenseTerms")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/customizeSetting.PNG "customizeSetting")
	- 手動設定網路介面 (192.168.0.100/255.255.255.0/192.168.0.1/8.8.8.8)
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/ama-networking-setting.PNG "ama-networking-setting")
	- 手動設定 C:\Windows\System32\drivers\etc\host，輸入 192.168.0.1 hyperv，儲存此文件
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/ama-dns-setting.PNG "ama-dns-setting")
	- Set up discovery for Azure Migrate<br>
		- Set up prerequisites，勾選 Accepted license terms，輸入 Credentials (administrator/isadmin@123)<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/windowsSecurity.PNG "windowsSecurity")
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completePrep.PNG "completePrep")
		- Register with Azure Migrate<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/registerAM.PNG "registerAM")
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/providehost.PNG "providehost")
		- Provide Hyper-V hosts details<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/addhosts.PNG "addhosts")
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/completeAM.PNG "completeAM")
		- 設定評估<br>
			- 在伺服器項目中，選擇「評定」<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentClick.PNG "assessmentClick")
			- 評定基本設定，輸入評定名稱「ServerAssessment」。點選「檢視全部」，更改目標位置為「日本東部」，保留的執行個體更改為「沒有任何保留的執行個體」，全選所有虛擬機器規格<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentBasic.PNG "assessmentBasic")
			- 輸入群組名稱「ServerGroup」，勾選 linux-ap、Win2k16-AP<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentSelect.PNG "assessmentSelect")
			- 建立評定<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentCreate.PNG "assessmentCreate")
		- 檢閱評量<br>
			- 在伺服器項目中，選擇評定結果<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentView.PNG "assessmentView")
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentView2.PNG "assessmentView2")
			- 觀察此評定整備程度、每月的成本預估、儲存體成本預估<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentView3.PNG "assessmentView3")
			- 選擇觀察特定虛擬機器的整備程度，點選win2k16-ap<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentView4.PNG "assessmentView4")
			- 觀察win2k16-ap的規格推薦、每月成本預估、目前使用量等詳細資訊<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/assessmentView5.PNG "assessmentView5")
 - 準備移轉 Hyper-V VM<br>
	- 在移轉工具 Azure Migrate: Server Migrate窗格中選擇「發現」
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateDiscovery.PNG "migrateDiscovery")
	- 您的電腦虛擬化了嗎?選擇「是，使用 Hyper-V」，目標區域選擇「日本東部」，勾選確認移轉目標區域為"日本東部"<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateCreateResorce.PNG "migrateCreateResorce")
	- 下載 Register Key 並安裝設定 AzureSiteRecoveryProvider<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateDownload.PNG "migrateDownload")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateInstall.PNG "migrateInstall")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateRegister.PNG "migrateRegister")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateNonproxy.PNG "migrateNonproxy")
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateFinish.PNG "migrateFinish")
	- 點選完成註冊按鈕完成註冊<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/migrateFinishenroll.PNG "migrateFinishenroll")
	- 複寫 Hyper-V VM<br>
		- 在移轉工具 Azure Migrate: Server Migrate窗格中選擇複寫<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationClick.PNG "replicationClick")
		- 在來源設定中，選擇「是，使用 Hyper-V」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting1.PNG "replicationSetting1")
		- 選擇「是，從 Azure Migrate 評定套用移轉設定」，選擇群組「ServerGourp」，選擇評定「ServerAssessment」，我們選擇 Azure VM 整備度完整的win2k16-ap<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting2.PNG "replicationSetting2")
		- 選擇資源群組「ServerMigrate」，複寫儲存體選擇建立 hyperv 虛擬機器同時建立的儲存體帳戶，虛擬網路選擇「vNet」，子網路選擇「subnet」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting3.PNG "replicationSetting3")
		- 選擇作業系統類型「Windows」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting4.PNG "replicationSetting4")
		- 此步驟不須選擇<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting5.PNG "replicationSetting5")
		- 按下複寫按鈕，開始執行複寫<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting6.PNG "replicationSetting6")
	- 執行測試移轉<br>
		- 在移轉工具 Azure Migrate: Server Migrate 窗格中選擇「正在複寫的伺服器」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting7.PNG "replicationSetting7")
		- 查看win2k16-ap複寫狀態並點選<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting8.PNG "replicationSetting8")
		- 查看win2k16-ap複寫詳細資訊<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting9.PNG "replicationSetting9")
		- 點選一般類別中的「計算與網路」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting10.PNG "replicationSetting10")
		- 因為模擬環境中win2k16-ap的內部靜態 IP 為 192.168.0.5，不變更OS內的網路設定下，必須要設定移轉後的靜態 IP<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting11.PNG "replicationSetting11")
		- 點選「編輯」後，再點選「InternalNAT」，將私人 IP 位置輸入 192.168.0.5 後，點選「確定」，完成後點選「儲存」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting12.PNG "replicationSetting12")
		- 您現在可以開始進行測試移轉，測試移轉可以讓您不停機的狀況下，測試移轉後的結果是否符合預期。現在就按下「測試移轉」吧!<br>
			- 虛擬網路請選擇「vNet」後，按下「測試移轉」<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting13.PNG "replicationSetting13")
			- 查看測試移轉作業，圖示中狀態顯示順利測試移轉<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting14.PNG "replicationSetting14")
		- 尋找並點選資源群組「serverMigrate」，您會發現您的虛擬機器名稱為「win2k16-AP-test」，代表為測試移轉的虛擬機器，您必須手動將基礎設施關聯，等等我們將把公用 IP 「win2k16-ap-pip」關聯至網路介面，請注意，您的公用 IP 與我不同<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting15.PNG "replicationSetting15")
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting16.PNG "replicationSetting16")
		- 現在讓我們在瀏覽器上，輸入公用 IP，檢查是否有正常顯示，如下圖所示，確認服務正常運作!<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting17.PNG "replicationSetting17")
		- 完成測試移轉後，請在「正在複寫的機器」頁面中，點選「...」，選擇「清除測試移轉」，勾選「測試已完成。請刪除測試虛擬機器。」，最後點選「清除測試」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting18.PNG "replicationSetting18")
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting20.PNG "replicationSetting20")
	- 移轉 VM<br>
		- 在移轉工具 Azure Migrate: Server Migrate 窗格中選擇「移轉」<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting21.PNG "replicationSetting21")
		- 選取 「是」 可關閉機器並執行規劃的移轉，而完全不會遺失資料，如果您選擇不關閉虛擬機器，將會在移轉前執行最終同步，但不會複寫在開始最終同步後機器上進行的所有變更。<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting22.PNG "replicationSetting22")
	- 完成移轉<br>
		- 查看計劃內的容錯移轉移轉作業<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting23.PNG "replicationSetting23")
		- 尋找並點選資源群組「serverMigrate」，您會發現您的虛擬機器名稱為「win2k16-AP」，代表為移轉的虛擬機器，您必須手動將基礎設施關聯，等等我們將把公用 IP 「win2k16-ap-pip」關聯至網路介面，請注意，您的公用 IP 與我不同<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting24.PNG "replicationSetting24")
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting16.PNG "replicationSetting16")
		- 現在讓我們在瀏覽器上，輸入公用 IP，檢查是否有正常顯示，如下圖所示，確認服務正常運作!<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting17.PNG "replicationSetting17")
		- Hyper-V manager 上的 win2k16-ap 確實已關機
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate-Hand-on-Lab/blob/master/image/replicationSetting25.PNG "replicationSetting25")
## 移轉後的最佳做法 <br>

恭喜您已經完成了，但移轉後還是有些工作要做，後續工作您可以參考官方文件說明「移轉後的最佳做法」<br>
https://docs.microsoft.com/zh-tw/azure/migrate/tutorial-migrate-hyper-v#post-migration-best-practices

**參考來源與更詳細的說明**
https://docs.microsoft.com/zh-tw/azure/migrate/tutorial-prepare-hyper-v