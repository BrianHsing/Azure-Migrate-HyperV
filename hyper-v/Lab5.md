# Lab5 - 複寫 Hyper-V VM
- 在移轉工具 Azure Migrate: Server Migrate窗格中選擇複寫<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationClick.PNG "replicationClick")<br>
- 在來源設定中，選擇「是，使用 Hyper-V」<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting1.PNG "replicationSetting1")<br>
- 選擇「是，從 Azure Migrate 評定套用移轉設定」，選擇群組「ServerGourp」，選擇評定「ServerAssessment」，我們選擇 Azure VM 整備度完整的win2k16-ap<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting2.PNG "replicationSetting2")<br>
- 選擇資源群組「ServerMigrate」，複寫儲存體選擇建立 hyperv 虛擬機器同時建立的儲存體帳戶，虛擬網路選擇「vNet」，子網路選擇「subnet」<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting3.PNG "replicationSetting3")<br>
- 選擇作業系統類型「Windows」<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting4.PNG "replicationSetting4")<br>
- 此步驟不須選擇<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting5.PNG "replicationSetting5")<br>
- 按下複寫按鈕，開始執行複寫<br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/replicationSetting6.PNG "replicationSetting6")<br>

前往 [Lab6 - 執行測試移轉](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/Lab6.md)<br>