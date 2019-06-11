echo *****************STARTING WINDOWS VM PREP_2****************

echo *****************Installing BoxStarter****************

choco install -y boxstarter

echo *****************Installing Softwares****************

copy /Y "%systemdrive%\vagrant\software_list.txt" "%temp%\software_list.txt"
 
@powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module $env:programdata\boxstarter\boxstarter.chocolatey\boxstarter.chocolatey.psd1;Install-BoxStarterPackage -PackageName $env:temp\software_list.txt"

echo "*****************WINDOWS VM PREP_2 COMPLETE****************"