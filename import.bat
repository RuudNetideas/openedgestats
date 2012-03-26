@pushd %~dp0
call "%DLC%\bin\prowin32" -db dbstat -H localhost -S 20000 -U sysprogress -P admin -b -p src/%IMPORT% -param %IMPORTDIR% -clientlog %OUTPUT%.log >> %OUTPUT% 2>&1
@popd