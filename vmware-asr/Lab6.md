# Lab6 - 設定流量管理員與應用程式閘道

## 建立應用程式閘道
- 從 Azure 入口網站上方搜尋欄輸入「應用程式」，請點選「應用程式閘道」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-1.png "appgw-1")<br>
- 點選圖示內紅框的「新增」，建立新的應用程式閘道<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-2.png "appgw-2")<br>
- 選擇對應的訂用帳戶、資源群組 asr-rg、應用程式閘道名稱 asr-waf、定價層選擇 WAF V2、防火牆模式選擇 Detetion，此模式只會偵測不會阻擋，最後在選擇稍早預先建立的子網路 waf-subnet，完成後點選下一步<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-3.png "appgw-3")<br>
- 此範例應用程式閘道會直接面向網際網路，所以要建立公用類型的前端 IP 位址，點選「新增」，完成後點選下一步<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-4.png "appgw-4")<br>
- 加入 AP01 的內部 IP 位址 172.16.10.9，請手動輸入，因為清除測試容錯移轉時，會移除網路卡介面，完成後點選下一步<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-5.png "appgw-5")<br>
- 在路由規則中，輸入規則名稱，並且在接聽程式頁籤中設定接聽程式名稱、前端 IP 選擇公用，其餘設定預設不變，因為此範例僅使用 HTTP 協定<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-6.png "appgw-6")<br>
- 點選後端目標後，會看到新增 HTTP 設定頁面，輸入 HTTP 設定名稱即可，其餘設定預設不變，點選確認<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-7.png "appgw-7")<br>
- 驗證成功後，請點選建立<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-8.png "appgw-8")<br>
- 完成建立後就可以在 asr-waf 概觀頁面中看到前端公用位址 asr-waf-pip，請先記起來這組 IP 位址稍後會使用到<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/appgw-9.png "appgw-9")<br>

## 建立流量管理員
- 從 Azure 入口網站上方搜尋欄輸入「流量管理員」，請點選「流量管理員設定檔」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-1.png "trafficmanager-1")<br>
- 點選圖示內紅框的「新增」，建立新的流量管理員設定檔<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-2.png "trafficmanager-2")<br>
- 輸入名稱，這個名稱會做為 DNS 位置，路由方法選擇優先順序，這可以讓您自訂路由的順序，選擇對應訂用帳戶，資源群組選擇 asr-rg，完成後選擇建立<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-3.png "trafficmanager-3")<br>
- 完成建立後，可以在流量管理員設定檔 asr0604 概觀頁面上看到 DNS 名稱、路由方法，請先紀錄 DNS 名稱，稍後會用到。在左欄設定功能欄位中，選擇紅框「端點」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-4.png "trafficmanager-4")<br>
- 點選新增端點後，會看到新增端點頁籤，選擇外部端點類型，輸入名稱 asr-waf-ip，在完整網域名稱或 IP 欄位填入剛剛所記錄的公用位址 asr-waf-pip 的 IP 位址，優先順序填入 1。另外再新增一個端點，這個時候會看到您只能選擇使用外部端點，名稱填入 onprem-pip，填入內部部署的公用 IP 位址，優先順序輸入 2。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-5-1.png "trafficmanager-5-1")<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-5.png "trafficmanager-5")<br>
- 到 DNS 服務供應商更改 DNS 紀錄，新增一筆 CNAME，主機位置輸入 demo，指向 asr0604.trafficmanager.net<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-6.png "trafficmanager-6")<br>
- 開啟瀏覽器輸入 demo.brianhsing.fun/wordpress 確認網頁是否正常顯示<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-7.png "trafficmanager-7")<br>
- 使用 NSLookup 確認對外 IP 位址確實指向 Azure<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-8.png "trafficmanager-8")<br>
- 我們再將流量管理員端點優先順序更改，將 asr-waf-pip 優先順序更改為 3<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-10.png "trafficmanager-10")<br>
- 使用 NSLookup 確認對外 IP 位址確實指向內部部署<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/images/trafficmanager-9.png "trafficmanager-9")<br>

 前往 [Lab7 - 清除測試容錯移轉](https://github.com/BrianHsing/Azure-Migrate/blob/master/vmware-asr/Lab7.md)<br>
