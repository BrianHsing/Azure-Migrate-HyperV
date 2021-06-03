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
- 設定 Azure 虛擬網路設定 asr-vnet，完成後點選確定即可進行測試容錯移轉<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-3.png "testfailover-3")<br>
- 完成後點選成功通知，觀察持續時間，可以觀察到本次測試容錯移轉耗用 2 分 3 秒<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-4.png "testfailover-4")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-5.png "testfailover-5")<br>
- 從 Azure 入口網站上方搜尋欄輸入 asr-rg，點選資源群組 asr-rg，即可看到已建立的資源。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-6.png "testfailover-6")<br>
- 點選虛擬機器 AP01-test，進入後點選紅框「連接」，點選「Bastion」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-7.png "testfailover-7")<br>
- 點選使用堡壘，輸入您設定的帳號以及密碼後點選連線，測試是否能成功登入。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-8.png "testfailover-8")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-9.png "testfailover-9")<br>
- 看到畫面後即可完成此 Lab<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/testfailover-10.png "testfailover-10")<br>

  
前往 - [Lab6 - 設定流量管理員與應用程式閘道](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/Lab6.md)<br>