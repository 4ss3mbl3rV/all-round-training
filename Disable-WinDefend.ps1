$rootPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"
$realTimeProtectionPath = "$registryPath\Real-Time Protection"
$signatureUpdatePath = "$registryPath\Signature Update"
$spynetPath = "$registryPath\Spynet"


# Create registry keys if they don't exist
New-Item -Path $registryPath -Force | Out-Null
New-Item -Path $realTimeProtectionPath -Force | Out-Null
New-Item -Path $signatureUpdatePath -Force | Out-Null
New-Item -Path $spynetPath -Force | Out-Null

# Set registry values
Set-ItemProperty -Path $registryPath -Name "DisableAntiSpyware" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "DisableRealTimeMonitoring" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "DisableAntiVirus" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "DisableSpecialRunningModes" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "DisableRoutinelyTakingAction" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "ServiceKeepAlive" -Value 1 -Type DWord

Set-ItemProperty -Path $realTimeProtectionPath -Name "DisableBehaviourMonitoring" -Value 1 -Type DWord
Set-ItemProperty -Path $realTimeProtectionPath -Name "DisableOnAccessProtection" -Value 1 -Type DWord
Set-ItemProperty -Path $realTimeProtectionPath -Name "DisableRealtimeMonitoring" -Value 1 -Type DWord
Set-ItemProperty -Path $realTimeProtectionPath -Name "DisableScanOnRealtimeEnable" -Value 1 -Type DWord

Set-ItemProperty -Path $signatureUpdatePath -Name "ForceUpdateFromMU" -Value 1 -Type DWord
Set-ItemProperty -Path $spynetPath -Name "DisableBlockAtFirstSeen" -Value 1 -Type DWord

Write-Host "Windows Defender has been disabled via registry settings."
