@echo off
title Menu Principal
:menu
cls
echo ============================================
echo               Menu Principal
echo ============================================
echo 1. Crear una carpeta en Documentos
echo 2. Mostrar fecha y hora del sistema                             # El menu principal l'hem fet tots junts
echo 3. Mostrar especificaciones del PC                           
echo 4. Apagar el PC
echo 5. Salir
echo ============================================
set /p choice=Elige una opcion (1-5): 

if %choice%==1 goto crear_carpeta
if %choice%==2 goto fecha_hora
if %choice%==3 goto especificaciones
if %choice%==4 goto apagar
if %choice%==5 goto salir
goto menu

:crear_carpeta
set /p nombre=Introduce el nombre de la carpeta: 
mkdir "%userprofile%\Documents\%nombre%"                       # Aquest apartat l'ha fet Dereck de la Morena
echo Carpeta creada en Documentos.
pause
goto menu

:fecha_hora
echo La fecha y hora actual es:
date /t                                                        # Aquest apartat l'ha fet Adrià Siscart
time /t
pause
goto menu

:especificaciones
echo Especificaciones del PC:
echo GPU:
wmic path win32_videocontroller get name
echo CPU:                                                      # Aquest apartat l'ha fet Izan Fabregat
wmic cpu get name
echo RAM:
wmic memorychip get capacity
pause
goto menu

:apagar
echo Apagando el PC...                                          # Aquest apartat + la sortida del programa l'ha fet Daniel Cortes
shutdown /s /f /t 0
goto menu                                                    

:salir
exit
