# Lab4 - 啟用複寫

## 建立儲存體帳戶
- 從 Azure 入口網站上方搜尋欄輸入「儲存體」，請點選「儲存體帳戶」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/storage-1.png "storage-1")<br>
- 填入詳細資料，選擇訂用帳戶、資源群組、儲存體帳戶名稱、選擇標準、選擇 LRS 備援，點選「檢閱+建立」後再次按下「建立」，等待背景建立完即可<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/storage-2.png "storage-2")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/storage-3.png "storage-3")<br>

## 啟用複寫
- 選擇稍早建立的復原服務保存庫「asr-vault」，在功能列管理類別中，選擇「已複寫的項目」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/recoveryservicevault-6.png "recoveryservicevault-6")<br>
- 點選複寫，並選擇紅框處 VMware 與實體機器<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-1.png "replicate-1")<br>
- 選擇設定伺服器「ASRCS」，機器類型選擇「虛擬機器」，vCenter 伺服器/vSphere 主機選擇「ESXi67U3」，處理伺服器「ASRCS」。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-2.png "replicate-2")<br>
- 選擇災難復原的虛擬機器位於哪個子網路，此範例選擇 srv-subnet (172.16.10.0/24)，與內部部署網段一致。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-3.png "replicate-3")<br>
- 選擇您想複寫的虛擬機器。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-4.png "replicate-4")<br>
- 如果虛擬機器具有相依性，必須保有一致性時，請您建立複寫群組，並選擇要加入群組的虛擬機器。所有虛擬機器都會同時複寫，並在容錯移轉時共用相同的復原點。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-5.png "replicate-5")<br>
- 確認設定無誤後，點選啟用複寫，並且會顯示同步狀況，點選一部虛擬機器 AP01。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-6.png "replicate-6")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-9.png "replicate-9")<br>
- 點進來複寫中虛擬機器 AP01，可以看到基礎結構拓樸已及詳細狀態，點選左欄功能列選取「計算與網路」。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-10.png "replicate-10")<br>
- 因為需要容錯移轉後與內部部署網路設定的一致性，必須將設定靜態 IP 位址改成 172.16.10.9。另外 ADDS01 也會需要設定靜態 IP 位址，點選「編輯」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-11.png "replicate-11")<br>
- 點選內部部署網路名稱<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-12.png "replicate-12")<br>
- 容錯移轉設定中的私人 IP 位址請填入「172.16.10.9」，完成後選擇確定<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-13.png "replicate-13")<br>
- 「儲存」設定。完成此步驟後 ADDS01 也會做一樣的設定，此步驟就不另外呈現<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-14.png "replicate-14")<br>
- 因為有建立複寫群組，所以必須再設定復原方案，選擇稍早建立的復原服務保存庫「asr-vault」，在功能列管理類別中，選擇「Recovery Plan (Site Recovery)」，並點選紅框建立「復原方案」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-15.png "replicate-15")<br>
- 輸入復原方案名稱、選擇來源 ASRCS、目標選擇 Microsoft Azure、部署模型選擇 Resource Manager、並選取複寫群組 relicate-group，完成後點選建立。
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-16.png "replicate-16")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-17.png "replicate-17")<br>
- 完成後即會出現您剛建立的副援方案 restore-plan。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-18.png "replicate-18")<br>

   前往 [Lab5 - 執行災難復原演練](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/Lab5.md)<br>
