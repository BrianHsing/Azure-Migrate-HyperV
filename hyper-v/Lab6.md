# Lab6 - 移轉 VM
- 在移轉工具 Azure Migrate: Server Migrate 窗格中選擇「移轉」<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting21.PNG "replicationSetting21")<br>
- 選取 「是」 可關閉機器並執行規劃的移轉，而完全不會遺失資料，如果您選擇不關閉虛擬機器，將會在移轉前執行最終同步，但不會複寫在開始最終同步後機器上進行的所有變更。<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting22.PNG "replicationSetting22")<br>
- 完成移轉<br>
- 查看計劃內的容錯移轉移轉作業<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting23.PNG "replicationSetting23")<br>
- 尋找並點選資源群組「serverMigrate」，您會發現您的虛擬機器名稱為「win2k16-AP」，代表為移轉的虛擬機器，您必須手動將基礎設施關聯，等等我們將把公用 IP 「win2k16-ap-pip」關聯至網路介面，請注意，您的公用 IP 與我不同<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting24.PNG "replicationSetting24")<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting16.PNG "replicationSetting16")<br>
- 現在讓我們在瀏覽器上，輸入公用 IP，檢查是否有正常顯示，如下圖所示，確認服務正常運作!<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting17.PNG "replicationSetting17")<br>
- Hyper-V manager 上的 win2k16-ap 確實已關機
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting25.PNG "replicationSetting25")<br>
返回 [Azure Migration : 伺服器移轉工具， 將 Hyper-V VM 遷移至 Azure](https://github.com/BrianHsing/Azure-Migrate/tree/master/hyper-v)<br>