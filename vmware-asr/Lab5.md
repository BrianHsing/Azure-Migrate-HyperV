# Lab5 - 執行災難復原演練

- 點選剛剛建立的復原方案。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/replicate-18.png "replicate-18")<br>
- 點選測試容錯移轉<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-1.png "testfailover-1")<br>
- 復原點選擇<br>
  - 最新 (最低 RPO)：此選項會先處理已傳送到 Site Recovery 服務的所有資料，先為每部 VM 建立復原點後再進行容錯移轉。<br>
  - 最新多部 VM 處理 (低 RTO)：適用於多部 VM 已啟用多部 VM 一致性的復原計劃，啟用這項設定的 VM 會容錯移轉至最新一致復原點。<br>
  - 最近多部 VM 應用程式一致：適用於多部 VM 已啟用多部 VM 一致性的復原計劃，啟用這項設定的 VM 會容錯移轉至最新應用程式一致復原點。<br>
  - 最新處理 (低 RTO)：將計劃中所有 VM 容錯移轉到 Site Recovery 所處理的最新復原點<br>
  - 最新應用程式一致：會將計劃中所有 VM 容錯移轉到 Site Recovery 所處理的最新應用程式一致復原點<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-2.png "testfailover-2")<br>
-設定 Azure 虛擬網路設定 asr-vnet，完成後點選確定即可進行測試容錯移轉<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-3.png "testfailover-3")<br>

  
