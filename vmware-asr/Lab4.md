# Lab4 - 啟用複寫

- 從 Azure 入口網站上方搜尋欄輸入「儲存體」，請點選「儲存體帳戶」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/storage-1.png "storage-1")<br>
- 填入詳細資料，選擇訂用帳戶、資源群組、儲存體帳戶名稱、選擇標準、選擇 LRS 備援，點選「檢閱+建立」後再次按下「建立」，等待背景建立完即可<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/storage-2.png "storage-2")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/storage-3.png "storage-3")<br>
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
- 
