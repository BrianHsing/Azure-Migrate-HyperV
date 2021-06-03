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
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-6-1.png "deployconfigurationserver-6-1")<br>
  - 選擇您剛剛下載的 ova 檔案，並且輸入虛擬機器名稱，此處使用「ASRCS」<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-7.png "deployconfigurationserver-7")<br>
  - 選擇您要將此虛擬機器放置在哪個儲存區<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-8.png "deployconfigurationserver-8")<br>
  - 選擇網路對應、磁碟佈建選擇精簡、完成後自動開啟電源。<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-9.png "deployconfigurationserver-9")<br>
  - 完成上述後，點選完成，開始匯入。<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-10.png "deployconfigurationserver-10")<br>
  - 完成匯入後，開啟「ASRCS」虛擬機器，會看到 License terms，這一步點選 Accept<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-11.png "deployconfigurationserver-11")<br>
  - 輸入管理員密碼，並且登入<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-12.png "deployconfigurationserver-12")<br>
  - 進入桌面環境後，精靈會自動運作，會先請您輸入電腦名稱，此範例使用「ASRCS」，完成後點選 Next<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-13.png "deployconfigurationserver-13")<br>
  - 登入您的 Azure AD 帳號，這步驟會驗證您的帳號權限，此範例的 Azure AD 登入帳號擁有訂用帳戶的擁有人權限，完成後選擇 Next<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-14.png "deployconfigurationserver-14")<br>
  - 選擇您建立「Recovery Services 保存庫」所在的訂用帳戶 (Tenant)，完成驗證後，選擇 Reboot Now<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-15.png "deployconfigurationserver-15")<br>
  - 重新啟動完成後，進入桌面會自動開啟 Azure Site Recovery deployment 網頁，您可以透過上方功能列更改成中文(繁體)<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-16.png "deployconfigurationserver-16")<br>
  - 設定您要連線至內部佈署的網路介面卡以及連線至 Azure 元件的網路介面卡，會透過 9443 進行資料傳輸，本範例均使用同一張網路介面卡操作，設定完成後，點選儲存與繼續<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-17.png "deployconfigurationserver-17")<br>
  - 選擇復原保存庫，您需要登入 Azure AD 帳號，並選擇訂用帳戶、資源群組以及您建立的復原保存庫。過程中您需要允許所需的權限要求。<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-18.png "deployconfigurationserver-18")<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-19.png "deployconfigurationserver-19")<br>
  - 安裝所需要的 MySQL，完成安裝後，請點選繼續<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-20.png "deployconfigurationserver-20")<br>
  - 驗證設備設定，您可能會在正在檢查靜態 IP 位址會有驚嘆號，您只需要將內建網路卡更改為靜態 IP 位址即可<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-21.png "deployconfigurationserver-21")<br>
  - 您必須設定一組帳號，讓 Configuration Servers 能夠自動的探索 vCenter / vSphere Server <br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-22.png "deployconfigurationserver-22")<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-23.png "deployconfigurationserver-23")<br>
  - 您必須也設定一組帳號，讓 Configuration Servers 能夠在 VMware VM 中自動安裝 Azure Site Recovery 行動服務<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-24.png "deployconfigurationserver-24")<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-25.png "deployconfigurationserver-25")<br>
  - 確認完成所有項目後，點選完成設定，此步驟會需要等待數分鐘<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-26.png "deployconfigurationserver-26")<br>
    
  - 確認出現下圖後，代表已完成此 Lab<br>
    ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/deployconfigurationserver-27.png "deployconfigurationserver-27")<br>

 前往 [Lab4 - 準備基礎結構](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/Lab4.md)<br>

