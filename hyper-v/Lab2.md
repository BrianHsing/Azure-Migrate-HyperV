# Lab2 - 準備評估 Hyper-V VM
- 點選「發現」<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/discovery.PNG "discovery")
	- 選擇「是，使用 Hyper-V」，輸入 Hyper-V 裝置名稱，並點選「產生金鑰」，完成後請複製並記好，最後，點選「下載」.VHD檔案<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/selectHypervanddownload-update.PNG "selectHypervanddownload")<br>
	- 解壓縮 AzureMigrateAppliance.zip，在 Hyper-V Manager 選擇 Import Virtual Machine 匯入<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/importama1.PNG "importama1")<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/importama2.PNG "importama2")<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/importama3.PNG "importama3")<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/importama4.PNG "importama4")<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/importama5.PNG "importama5")<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/completeimportama.PNG "completeimportama")<br>
	- 初始化設定 AzureMigrateAppliance_v3.20.05.27 (administrator/isadmin@123)<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/licenseTerms.PNG "licenseTerms")<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/customizeSetting.PNG "customizeSetting")<br>
	- 手動設定網路介面 (192.168.0.100/255.255.255.0/192.168.0.1/8.8.8.8)<br>
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/ama-networking-setting.PNG "ama-networking-setting")<br>
	- 手動設定 C:\Windows\System32\drivers\etc\host，輸入 192.168.0.1 hyperv，儲存此文件
	![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/ama-dns-setting.PNG "ama-dns-setting")<br>
	- Set up discovery for Azure Migrate<br>
    	- Browser https://localhost:44368<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/settingweb2. "settingweb2")<br>
		- Set up prerequisites，勾選 Accepted license terms，輸入 Credentials (administrator/isadmin@123)<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/windowsSecurity.PNG "windowsSecurity")<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/completePrep.PNG "completePrep")<br>
		- Register with Azure Migrate<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/registerAM.PNG "registerAM")<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/providehost.PNG "providehost")<br>
		- Provide Hyper-V hosts details<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/addhosts.PNG "addhosts")<br>
		![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/completeAM.PNG "completeAM")<br>
		- 設定評估<br>
			- 在伺服器項目中，選擇「評定」<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentClick.PNG "assessmentClick")<br>
			- 評定基本設定，輸入評定名稱「ServerAssessment」。點選「檢視全部」，更改目標位置為「日本東部」，保留的執行個體更改為「沒有任何保留的執行個體」，全選所有虛擬機器規格<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentBasic.PNG "assessmentBasic")<br>
			- 輸入群組名稱「ServerGroup」，勾選 linux-ap、Win2k16-AP<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentSelect.PNG "assessmentSelect")<br>
			- 建立評定<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentCreate.PNG "assessmentCreate")<br>
		- 檢閱評量<br>
			- 在伺服器項目中，選擇評定結果<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentView.PNG "assessmentView")<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentView2.PNG "assessmentView2")<br>
			- 觀察此評定整備程度、每月的成本預估、儲存體成本預估<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentView3.PNG "assessmentView3")<br>
			- 選擇觀察特定虛擬機器的整備程度，點選win2k16-ap<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentView4.PNG "assessmentView4")<br>
			- 觀察win2k16-ap的規格推薦、每月成本預估、目前使用量等詳細資訊<br>
			![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/assessmentView5.PNG "assessmentView5")<br>
前往 [Lab3 - 準備移轉 Hyper-V VM](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/Lab3.md)<br>