# Azure Server Migrate on Hyper-V
 透過Azure VM巢狀虛擬化建立單一Hyper-V主機，利用Azure Migrate輕鬆地將虛擬機器搬遷至Azure。

## 環境準備<br>
 - Azure 訂用帳戶、Azure 訂用帳戶擁有者權限<br>
 - 下載 Single-Hyper-V.ps1<br>
 - 使用 Single-Hyper-V.ps1 佈署 Hyper-V Server (21分鐘)<br> 
	- 啟用 CloudShell<br>
    - 輸入`Connect-AzAccount` 登入<br>
	- 上傳 Single-Hyper-V.ps1<br>
 - 設定客體虛擬機器的網際網路連線 (5分鐘)<br> 
 - 在 hyperv 虛擬機器中下載 VHD (5分鐘)<br>
	- 下載 Linux-AP - https://aka.ms/vhd-linux-ap<br>
	- 下載 win2k16-AP - https://aka.ms/vhd-win2k16-ap<br>
 - 匯入 Linux Server<br>
 - 匯入 Windows Server<br>

<h1>遷移流程</h1><br>
 - 建立 Azure Migrate<br>
 - 準備評估 Hyper-V VM<br>
 - 準備遷移 Hyper-V VM<br>

