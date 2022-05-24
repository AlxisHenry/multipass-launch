@echo off

:: Script de creation d'une machine de developpement

:: Lancement d'un machine avec le nom donne par l'utilisateur
set /p NAME=Nom de l'instance multipass:
if "%NAME%" == "" (SET NAME="default")
multipass launch -n %Name%

:: Configuration de l'instance
multipass exec %NAME% -- git clone https://github.com/AlxisHenry/linux-professional-environment.git
multipass exec %NAME% -- sleep 2
multipass exec %NAME% -- sh /home/ubuntu/linux-professional-environment/bin/test-env.sh