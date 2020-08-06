# Azure Server Migrate on Hyper-V
 透過Azure VM巢狀虛擬化建立單一Hyper-V主機，利用Azure Migrate輕鬆地將虛擬機器搬遷至Azure

# 環境準備<br>
 - Azure訂用帳戶、Azure訂用帳戶擁有者權限<br>
 - 下載Single-Hyper-V.ps1<br>
 - 使用Single-Hyper-V.ps1佈署Hyper-V Server(21分鐘)<br> 
 - 設定客體虛擬機器的網際網路連線(5分鐘)<br> 
 - 在hyperv虛擬機器中下載VHD<br>
 >>Linux-AP - https://aka.ms/vhd-linux-ap<br>
 >>win2k16-AP - https://aka.ms/vhd-win2k16-ap<br>
√ 匯入Linux Server<br>
√ 匯入Windows Server<br>

<h1>遷移流程</h1><br>
 √建立Azure Migrate<br>
 √準備評估Hyper-V VM<br>
 √準備遷移Hyper-V VM<br>

