# Lab3 - 佈署 Configuration Servers

- 選擇稍早建立的復原服務保存庫「asr-vault」，在功能列管理類別中，選擇「Site Recovery 基礎結構」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-1.png "deployconfigurationserver-1")<br>
- 左邊功能欄位點選「Configuration Servers」，點選紅框，新增伺服器<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-2.png "deployconfigurationserver-2")<br>
- 按照指示，逐步操作<br>
  > **Tips.VMware vSphere/vCenter 版本支援 5.5 以上，Configuration Servers 需要規格為 8 CPU、16 GB RAM、600 GB Disk、NIC 必須使用 VMXNET3，一台 Configuration Servers 最多可以複寫 550 VM** <br>
  
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-3.png "deployconfigurationserver-3")<br>
  - 下載 OVF 範本，您會下載一個大約 21.4 GB 的 ova 檔案<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-4.png "deployconfigurationserver-4")<br>
  - 登入 VMware 虛擬化平台管理介面，選擇「建立/登陸虛擬機器」<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-5.png "deployconfigurationserver-5")<br>
  - 選擇「從 OVF 或 OVA 檔案佈署虛擬機器」<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-6.png "deployconfigurationserver-6")<br>
  - 選擇您剛剛下載的 ova 檔案，並且輸入虛擬機器名稱，此處使用「ASRCS」<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-7.png "deployconfigurationserver-7")<br>
  - 選擇您要將此虛擬機器放置在哪個儲存區<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-8.png "deployconfigurationserver-8")<br>
  - 選擇網路對應、磁碟佈建選擇精簡、完成後自動開啟電源。<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-9.png "deployconfigurationserver-9")<br>
  - 完成上述後，點選完成，開始匯入。<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-10.png "deployconfigurationserver-10")<br>

