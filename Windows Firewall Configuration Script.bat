@echo off
rem Backup wfw configuration
if not exist "C:\Install\Backup" (
mkdir "C:\Install\Backup"
netsh advfirewall export "C:\Install\Backup\firewall-rules.wfw")
else (
netsh advfirewall export "C:\Install\Backup\firewall-rules.wfw")

cd /d "C:\Program Files (x86)\NCR APTRA\Security Policies W10\Tools"
MachineGPO.exe /Path:C:\Install\Backup /export
rem Do gpupdate after change gpo firewall configuration
rem gpupdate /force

rem Add rule Inbound (TestingRoom) Not use
rem netsh advfirewall firewall add rule name="Host Test" dir=in action=allow protocol=TCP remoteip=10.230.43.2,10.219.80.66,172.31.164.217,172.31.164.33,172.30.152.170 remoteport=1-65535
rem netsh advfirewall firewall add rule name="Server KMY Test" dir=in action=allow protocol=TCP remoteip=172.30.146.77,10.215.138.69 remoteport=1-65535
rem netsh advfirewall firewall add rule name="e-KYC Server test" dir=in action=allow protocol=TCP remoteip=172.30.77.59,172.30.65.38 remoteport=1-65535
rem netsh advfirewall firewall add rule name="RMM Server test " dir=in action=allow protocol=TCP remoteip=172.30.80.124 remoteport=1-65535
rem netsh advfirewall firewall add rule name="Vision" dir=in action=allow protocol=TCP remoteip=172.30.78.46 remoteport=1-65535
rem netsh advfirewall firewall add rule name="HDE" dir=in action=allow protocol=TCP remoteip=172.30.82.96 remoteport=1-65535
rem netsh advfirewall firewall add rule name="Solidcore" dir=in action=allow protocol=TCP remoteip=172.30.78.47 remoteport=1-65535

rem Add rule Outbound (TestingRoom&Prod)
netsh advfirewall firewall add rule name="Host Test" dir=out action=allow protocol=TCP remoteip=10.230.43.2,10.219.80.66,172.31.164.217,172.31.164.33,172.30.152.170 remoteport=4400-4600
netsh advfirewall firewall add rule name="Host Prod" dir=out action=allow protocol=TCP remoteip=10.15.6.1,10.15.6.3,10.15.6.21,10.15.6.22 remoteport=4400-4600
netsh advfirewall firewall add rule name="Server KMY Test" dir=out action=allow protocol=TCP remoteip=172.30.146.77 remoteport=5343,5344,5333,7333,7344
netsh advfirewall firewall add rule name="Server KMY Test_2" dir=out action=allow protocol=TCP remoteip=10.215.138.69 remoteport=5343,5333,7333
netsh advfirewall firewall add rule name="Server KMY Prod" dir=out action=allow protocol=TCP remoteip=10.15.6.41 remoteport=5344,7344
netsh advfirewall firewall add rule name="e-KYC Server Test" dir=out action=allow protocol=TCP remoteip=172.30.77.59 remoteport=22000
netsh advfirewall firewall add rule name="e-KYC Server Test_2" dir=out action=allow protocol=TCP remoteip=172.30.65.38 remoteport=12000
netsh advfirewall firewall add rule name="e-KYC Server Prod" dir=out action=allow protocol=TCP remoteip=10.15.6.53 remoteport=22000
netsh advfirewall firewall add rule name="RMM Server Test " dir=out action=allow protocol=TCP remoteip=172.30.80.124 remoteport=1-65535
netsh advfirewall firewall add rule name="RMM Server Prod " dir=out action=allow protocol=TCP remoteip=172.30.80.124 remoteport=443,4321,4322,10030-10040
netsh advfirewall firewall add rule name="Vision Test" dir=out action=allow protocol=TCP remoteip=172.30.78.46 remoteport=1-65535
netsh advfirewall firewall add rule name="Vision Prod" dir=out action=allow protocol=TCP remoteip=10.15.6.54 remoteport=1-65535
netsh advfirewall firewall add rule name="HDE Test" dir=out action=allow protocol=TCP remoteip=10.15.6.56 remoteport=1-65535
netsh advfirewall firewall add rule name="HDE Prod" dir=out action=allow protocol=TCP remoteip=172.30.82.96 remoteport=1-65535
netsh advfirewall firewall add rule name="Solidcore Test" dir=out action=allow protocol=TCP remoteip=172.30.78.47 remoteport=1-65535
netsh advfirewall firewall add rule name="Solidcore Prod" dir=out action=allow protocol=TCP remoteip=10.15.6.55 remoteport=1-65535
