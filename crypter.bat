@echo off
:: Program name : Crypter
:: create by : Saad Anouar

mode con: cols=65 lines=15
::decission session for user
:home
cls
echo. && color 9
echo. && echo.
echo            ___^|                      ^|               
echo           ^|       __^|  ^|   ^|  __ \   __^|   _ \   __^| 
echo        ^|      ^|     ^|   ^|  ^|   ^|  ^|     __/  ^|    
echo          \____^| _^|    \__, ^|  .__/  \__^| \___^| _^|    
echo                       ____/  _^|                             
echo. & echo. & echo.
%windir%\system32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor red Did you want to :
echo                        Crypte [C], Decrypt [D] ?
echo                               [x] exit
echo.
set /p answer=
if %answer% ==c goto cryptefile
if %answer% ==d goto decryptfile
if %answer% ==x msg * THANKS FOR USING TRENSISSTOR, WELCOME BACK AGAIN DEAR : \\  %username% && exit
goto home

:: Encrypting file using bas64 
:cryptefile
cls

echo                             _
echo                            ^| ^|
echo                        __  ^| ^|  __
echo                        \ \ ^| ^| / /
echo                         \ \^| ^|/ /
echo                          \     /
echo                           \   /       
echo               ^|  ^|         \ /         ^|  ^|
echo               ^|  ^|_____________________^|  ^|
echo               ^|___________________________^|
echo.
%windir%\system32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor red Drop your file here for Encrypting :
echo or (Click [b] to go back home)
echo.
set /p file="    ---->   "
if %file% ==b goto home
if not exist %file% goto cryptefile
set /p Encryptfilename="Encrypted File name :   "
set destination="C:\Users\%username%\Desktop\%Encryptfilename%.txt"
certutil -encode %file% %destination%
cls
echo. & echo. & echo                 Waiting for Encrypting ...
TIMEOUT /T 3 >nul
echo.
echo Program Written by : Saad Anouar >>%destination%
echo Be sure to download the program from this link: https://github.com/anrsaad/Crypter >>%destination%
echo file Created AT %date% in %time% >>%destination%
echo Please be sure to not write or modify this file to not make damage to decrypting file >>%destination%
for %%x in (%file:\= %) do set last=%%x
echo %last% >>%destination%
cls
msg * Your file %Encryptfilename%.txt has been Encrypted Sussefully. You will find it into your Desktop 
goto home

:: DEcrypte session: get the extention of file from inside file and decrypte the file
:decryptfile
cls

echo                             _
echo                            ^| ^|
echo                        __  ^| ^|  __
echo                        \ \ ^| ^| / /
echo                         \ \^| ^|/ /
echo                          \     /
echo                           \   /       
echo               ^|  ^|         \ /         ^|  ^|
echo               ^|  ^|_____________________^|  ^|
echo               ^|___________________________^|
echo.
%windir%\system32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor red Drop file here to Dencrypte:
echo or (Click [b] to go back home) 
set /p file2=" ---->    "
echo.
if %file2% ==b goto home 
if not exist %file2% echo this file doesnt exist or you typing fail && TIMEOUT /T 3 >nul && cls && goto decryptfile
:: check if the file is a base64 crypte or not 
find /c "-----BEGIN CERTIFICATE-----" %file2% && (echo found && goto start) || (echo not found && goto check)

:start
for /F "delims=" %%a in (%file2%) do (set "lline=%%a")
echo %lline%
set destination2="C:\Users\%username%\Desktop\%lline%"
echo.
certutil -decode %file2% %destination2%
cls
echo. & echo. & echo                 Waiting for Decrypting ...
TIMEOUT /T 3 >nul
msg * Your file %file2% has been Decrypted , bey 

goto home

:check
cls
echo. && echo   this is not our decryption go back home and select the correct file
echo.
echo             click anywhere to go back
pause >nul
goto home


