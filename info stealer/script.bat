@echo off
color 0a

set "output=%cd%\all_output"

if not exist "%output%" ( 
    mkdir "%output%" 
)

start "" "%cd%\Tools\BrowsingHistoryView.exe" /stext "%output%\Browsing History.txt"
start "" "%cd%\Tools\ChromeCookiesView.exe" /stext "%output%\ChromeCookiesView.txt"
start "" "%cd%\Tools\EdgeCookiesView.exe" /stext "%output%\EdgeCookiesView.txt"
start "" "%cd%\Tools\EventLogSourcesView.exe" /stext "%output%\EventLogSourcesView.txt"
start "" "%cd%\Tools\FBCacheView.exe" /stext "%output%\FBCacheView.txt"
start "" "%cd%\Tools\VideoCacheView.exe" /stext "%output%\VideoCacheView.txt"  

set "info=%output%\Information.txt"

echo Today Date is: %date% > "%info%"
echo. >> "%info%"
echo ================================= >> "%info%"
echo User Profile >> "%info%"
echo ================================= >> "%info%"
echo. >> "%info%"
echo User Profile: %USERPROFILE% >> "%info%"
echo. >> "%info%"
echo. >> "%info%"

echo ================================= >> "%info%"
echo User Name >> "%info%"
echo ================================= >> "%info%"
echo. >> "%info%"
echo User Name: %USERNAME% >> "%info%"
echo. >> "%info%"
echo. >> "%info%"

echo ================================= >> "%info%"
echo Computer Name and OS Name >> "%info%"
echo ================================= >> "%info%"
echo. >> "%info%"
echo Computer Name is: %COMPUTERNAME% >> "%info%" 
echo Computer Operating System is: %OS% >> "%info%"
echo. >> "%info%"
echo. >> "%info%"

echo ============================== >> "%info%"
echo Listing all local IP addresses >> "%info%"
echo ============================== >> "%info%"

echo IP: >> "%info%"
ipconfig | findstr /i "IPv4" >> "%info%"
echo. >> "%info%"
echo. >> "%info%"

echo IP: >> "%info%"
ipconfig | findstr /i "IPv6" >> "%info%"

echo. >> "%info%"
echo. >> "%info%"

echo ============================== >> "%info%"
echo Task List >> "%info%"
echo ============================== >> "%info%"
echo. >> "%info%"
tasklist >> "%info%"
echo. >> "%info%"
echo. >> "%info%"

echo ============================== >> "%info%"
echo NET USER >> "%info%"
echo ============================== >> "%info%"
echo. >> "%info%"
NET USER >> "%info%"
echo. >> "%info%"
echo. >> "%info%"

echo =============================== >> "%info%"
echo NET USER GUEST >> "%info%"
echo =============================== >> "%info%"
echo. >> "%info%"
net user Guest >> "%info%"


set "Output=%output%\some_file"
if not exist "%Output%" ( 
    mkdir "%Output%" 
)

set edge=C:\Users\Azmain\AppData\Local\Microsoft\Edge\User Data\Default\Cache\Cache_Data
set edge1=C:\Users\Azmain\AppData\Local\Microsoft\Edge\User Data\Default\Sessions
set destination=%Output%


xcopy /s /e /y "%edge%" "%destination%"  >nul 2>&1 || echo Failed to copy from edge.  
xcopy /s /e /y "%edge1%" "%destination%" >nul 2&>1 || echo Failed to copy from edge1.

exit 
