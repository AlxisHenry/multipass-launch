@echo off

:: Lancement d'un machine avec le nom donne par l'utilisateur
set /p NAME=Nom de l'instance multipass:
if "%NAME%" == "" (SET NAME="default")
multipass launch -n %Name%

:: Type de machine
set /p TYPE=Type de machine (dev/test):
if "%TYPE%" == "" (SET TYPE=dev)
if not "%TYPE%" == "dev" ( if not "%TYPE%" == "test" ( SET TYPE=dev )) 
echo "Type de machine : %TYPE%"

:: Configuration de l'instance
multipass exec %NAME% -- git clone https://github.com/AlxisHenry/linux-professional-environment.git
multipass exec %NAME% -- sleep 2

:: Lancement d'un script en fonction de la machine
if "%TYPE%" == "dev" (multipass exec %NAME% -- sh /home/ubuntu/linux-professional-environment/bin/setup.sh)
if "%TYPE%" == "test" (multipass exec %NAME% -- sh /home/ubuntu/linux-professional-environment/bin/test-env.sh)