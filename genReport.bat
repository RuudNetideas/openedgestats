@set BIRT_HOME=D:\BirtRuntime-3.7.1

@pushd %~dp0
call "%BIRT_HOME%\reportEngine\genReport.bat" --format PDF --locale fr --output gen\%DOMAIN%\Global-%YEAR%-%1.pdf --parameter "user=admin@%DOMAIN%" --parameter "Param1=%DEBUT%" --parameter "Param2=%FIN%" --parameter "DbNamePrm=%1" reports\monthlyReport.rptdesign
@popd