@SETLOCAL ENABLEdelayedExpansion
@echo off

set "ls_file_path=C:\Users\Alexis\Desktop\multipass\script-multipass-launch\tests\ls.txt"
set "host_file_path=C:\Windows\System32\drivers\etc\hosts"
set /p instance_to_add="Quelle machine souhaitez vous ajouter ? "
set /p domain_to_add="Quel domaine souhaitez-vous attribués ? "
set "exclude_this=Name                    State             IPv4             Image"

if "%instance_to_add%" == "" (exit)
if "%domain_to_add%" == "" (exit)

multipass ls > %ls_file_path%

set /A Counter=0


			
for /F "delims=" %%l in (%ls_file_path%) do (
	
	echo %%l

	

)

     


echo "coucou" >> %host_file_path%


