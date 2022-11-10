@echo off

::decission session for user
:home
cls
echo. && color 9
echo   ^_^_ ^_^_^| ^_ \  ^_^_^|   \ ^|   ^_^_^| ^_ ^_^|   ^_^_^|   ^_^_^| ^_^_ ^_^_^| ^_ \  ^_ \
echo      ^|     /  ^_^|   .  ^| \^_^_ \   ^|  \^_^_ \ \^_^_ \    ^|  (   ^|   / 
echo     ^_^|  ^_^|^_\ ^_^_^_^| ^_^|\^_^| ^_^_^_^_/ ^_^_^_^| ^_^_^_^_/ ^_^_^_^_/   ^_^| \^_^_^_/ ^_^|^_\ 
echo.
echo. & echo. & echo. & echo. & echo.
echo Did you want to :
echo                        Crypte [C], Decrypt [D] ?
echo                               [x] exit
echo.
set /p answer=
if %answer% ==c goto cryptefile
if %answer% ==d goto decryptfile
if %answer% ==x msg * THANKS FOR USING TRENSISSTOR, WELCOME BACK AGAIN DEAR : \\ %username% && exit
goto home

:: Encrypting file using bas64 
:cryptefile
cls

echo                              _
echo	                	^| ^|
echo	              __ 	^| ^|  __
echo                \ \	^| ^| / /
echo                 \ \^| ^|/ /
echo                  \       /
echo                   \     /         __
echo       ^|  ^|     	\   /	    ^|  ^|
echo       ^|  ^|_____________________^|  ^|
echo       ^|___________________________^|
echo.
set /p file="Drop your file to ENCRYPTE here "
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
for %%x in (%file:\= %) do set last=%%x
echo %last% >>%destination%
cls
msg * Your file %Encryptfilename%.txt has been Encrypted Sussefully. You will find it into your Desktop 
goto home

:: DEcrypte session: get the extention of file from inside file and decrypte the file
:decryptfile
cls
set /p file2="DRop file to Dencrypte: "

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


