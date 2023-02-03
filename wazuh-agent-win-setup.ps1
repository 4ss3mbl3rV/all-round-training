Write-Host @"
============================
  Wazuh Agent Installation
============================
"@
$group = Read-Host -Prompt "Please Enter your group: "

if( $group -match "^financ.*(_department)?" ){
    Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.10.msi /q WAZUH_MANAGER='anousith.siem.cyberus.la' WAZUH_REGISTRATION_SERVER='anousith.siem.cyberus.la' WAZUH_AGENT_GROUP='financial_department,windows'
} elseif ( $group -match "^IT(_department)?"){
    Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.10.msi /q WAZUH_MANAGER='anousith.siem.cyberus.la' WAZUH_REGISTRATION_SERVER='anousith.siem.cyberus.la' WAZUH_AGENT_GROUP='IT_department,windows' 
} else {
    throw "Error occured!"
}
NET START WazuhSvc

Write-Host @"
=======================
  Sysmon Installation
=======================
"@
Invoke-WebRequest -Uri https://download.sysinternals.com/files/Sysmon.zip -OutFile $env:TEMP\Sysmon.zip
Expand-Archive -Path $env:TEMP\Sysmon.zip -DestinationPath $env:ProgramFiles\Sysmon
Invoke-WebRequest -Uri https://raw.githubusercontent.com/branchnetconsulting/wazuh-training-files/master/sysmonconfig.xml -OutFile $env:ProgramFiles\Sysmon\sysmonconfig.xml
Remove-Item -Path $env:TEMP\Sysmon.zip -Force
$env:ProgramFiles\Sysmon\Sysmon.exe -accepteula -i $env:ProgramFiles\Sysmon\sysmonconfig.xml
