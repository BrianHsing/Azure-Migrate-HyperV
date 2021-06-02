# VMware VM 災難備援至 Azure
 本篇文章透過實際演練，教學如何將 Azure 災難備復原的解決方案實作在內部佈署 VMware VM 環境中，透過 Azure 服務流量管理員與應用程式閘道的配合，來降低災難復原的復原時間目標，並且保護對外服務網站。<br>
 本篇文章實作時間大約需要花費 60 分鐘，完成後您將學會以下項目：<br>
    - 建立復原保存庫，保存庫會保存 VMware VM 的中繼資料和組態資訊。<br>
    - 建立虛擬網路，您必須考慮您容錯移轉後的網路環境，如果您需要同樣的網段分配、並且有設定靜態 IP，必須在這個步驟謹慎設定。<br>
    - 設定適用於 VMware 的 Site Recovery 基礎結構
## 環境架構 <br>
![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/asr-architecture.png "asr-architecture")

## 演練流程 <br>
- [Lab1 - 建立復原保存庫]()<br>
- [Lab2 - 建立虛擬網路與堡壘機]()<br>
- [Lab3 - 佈署 Configuration Servers]()<br>
- [Lab4 - 準備基礎結構]()<br>
- [Lab5 - 啟用複寫]()<br>
- [Lab6 - 執行災害復原演練]()<br>
- [Lab7 - 設定流量管理員與應用程式閘道]()<br>
- [Lab8 - 正式容錯移轉至 Azure]()<br>