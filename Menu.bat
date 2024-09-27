@echo off
setlocal enabledelayedexpansion

set log_file="%USERPROFILE%\Documents\log_%date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%.txt"

:menu
cls
echo ================================
echo Menu Principal
echo ================================
echo 1. Afegir usuari
echo 2. Configurar serveis
echo 3. Monitoritzar transferencia de paquets
echo 4. Eliminar logs
echo 5. Sortir
echo ================================
set /p opcio="Escull una opcio: "

if %opcio%==1 goto afegir_usuaris
if %opcio%==2 goto configurar_serveis
if %opcio%==3 goto monitoritzar_xarxa
if %opcio%==4 goto eliminar_logs
if %opcio%==5 goto sortir
goto menu

:afegir_usuaris
set /p usuari=Introdueix el nom del nou usuari: 
set /p contrasenya=Introdueix la contrasenya per al nou usuari: 
net user %usuari% %contrasenya% /add                                               # Aixó ho ha fet Dereck de la Morena
if !errorlevel! == 0 (
    echo Usuari %usuari% creat correctament >> %log_file%
) 
pause
goto menu


:configurar_serveis
echo Obrint aplicacio de serveis de Windows...
start services.msc                                                                 # Aixó ho ha fet Adrià Siscart
echo Aplicació de serveis de Windows oberta >> %log_file%
pause
goto menu

:monitoritzar_xarxa
set /p url=Introdueix la URL (amb www): 
echo Executant tracert per a %url%...
tracert %url% >> %log_file%
echo %log_file%                                                                    # Aixó ho ha fet Izan Fabregat
echo Tracert per a %url% completat >> %log_file%
echo Comproba Documents per a veure el log amb tota la informacio
pause
goto menu

:eliminar_logs
echo Eliminant fitxers de log...
:delete_loop
set deleted=0                                                                      # Aixó ho ha fet Daniel Cortes
for /r "%USERPROFILE%\Documents" %%f in (log*) do (
    del "%%f"
    set deleted=1
)
if %deleted%==1 goto delete_loop
echo Tots els fitxers de log han estat eliminats. >> %log_file%
pause
goto menu

:sortir
echo Sortint...
echo Script finalitzat >> %log_file%
pause
exit
