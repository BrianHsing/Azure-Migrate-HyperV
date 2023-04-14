# Lab2 - 發現 Hyper-V VM

- 點選「發現」<br>
![GITHUB](image/discovery.PNG "discovery")
- 選擇「是，使用 Hyper-V」，輸入 Hyper-V 裝置名稱，並點選「產生金鑰」，完成後請複製並記好，最後，點選「下載」.VHD檔案<br>
![GITHUB](image/selectHypervanddownload-update.PNG "selectHypervanddownload")<br>
- 解壓縮 AzureMigrateAppliance.zip，在 Hyper-V Manager 選擇 Import Virtual Machine 匯入<br>
![GITHUB](image/importama1.PNG "importama1")<br>
![GITHUB](image/importama2.PNG "importama2")<br>
![GITHUB](image/importama3.PNG "importama3")<br>
![GITHUB](image/importama4.PNG "importama4")<br>
![GITHUB](image/importama5.PNG "importama5")<br>
![GITHUB](image/completeimportama.PNG "completeimportama")<br>
- 初始化設定 AzureMigrateAppliance_v3.20.05.27 (administrator/isadmin@123)<br>
![GITHUB](image/licenseTerms.PNG "licenseTerms")<br>
![GITHUB](image/customizeSetting.PNG "customizeSetting")<br>
- 手動設定網路介面 (192.168.0.100/255.255.255.0/192.168.0.1/8.8.8.8)<br>
![GITHUB](image/ama-networking-setting.PNG "ama-networking-setting")<br>
- 手動設定 C:\Windows\System32\drivers\etc\host，輸入 192.168.0.1 hyperv，儲存此文件
![GITHUB](image/ama-dns-setting.PNG "ama-dns-setting")<br>
- Browser https://localhost:44368<br>
![GITHUB](image/settingweb2.png "settingweb2")<br>
- Set up prerequisites<br>
![GITHUB](/image/Setupprerequisites.png "Setupprerequisites")<br>
- Register with Azure Migrate (將剛儲存的金鑰填入，並登入您的帳號)<br>
![GITHUB](image/registerwithazuremigrate.png "registerwithazuremigrate")<br>
![GITHUB](image/registerwithazuremigrate2.png "registerwithazuremigrate2")<br>
![GITHUB](image/registerwithazuremigrate3.png "registerwithazuremigrate3")<br>
![GITHUB](image/registerwithazuremigrate4.png "registerwithazuremigrate4")<br>
- Provide Hyper-V hosts details (輸入 hyperv 的驗證帳密 hyadmin/hyadmin@1234)<br>
![GITHUB](image/managecredentials.png "managecredentials")<br>
![GITHUB](image/managecredentials2.png "managecredentials2")<br>

前往 [Lab3 - 評定 Hyper-V VM](Lab3.md)<br>