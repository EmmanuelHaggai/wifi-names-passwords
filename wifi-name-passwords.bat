@echo off
title Emmanuel Haggai: Wifi Names and Passwords
echo Wi-Fi Names and Passwords 
echo --------------------------
setlocal enabledelayedexpansion

:: Get Wi-Fi profiles
for /f "tokens=4*" %%a in ('netsh wlan show profiles ^| find "All User Profile"') do (
    set "profileName=%%b"

    :: Get Wi-Fi password for the current profile
    for /f "tokens=4*" %%c in ('netsh wlan show profile name^="!profileName!" key^=clear ^| find "Key Content"') do (
        echo Name: !profileName!
        echo Password: %%c 
	echo -------------------------
    )
)

endlocal
pause
exit /b 0
