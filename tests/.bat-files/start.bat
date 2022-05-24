@echo off

:: Input for the name of the instance
set /p NAME=Name:
if "%NAME%" == "" (SET NAME="default")
multipass launch -n %Name%

:: Type
set /p TYPE=Type (dev/test):
if "%TYPE%" == "" (SET TYPE=dev)
if not "%TYPE%" == "dev" ( if not "%TYPE%" == "test" ( SET TYPE=dev )) 
echo "Type de machine : %TYPE%"

:: Config of the instance
multipass exec %NAME% -- git clone https://github.com/AlxisHenry/linux-professional-environment.git
multipass exec %NAME% -- sleep 2

:: Launch script
if "%TYPE%" == "dev" (multipass exec %NAME% -- sh /home/ubuntu/linux-professional-environment/bin/setup.sh)
if "%TYPE%" == "test" (multipass exec %NAME% -- sh /home/ubuntu/linux-professional-environment/bin/test-env.sh)