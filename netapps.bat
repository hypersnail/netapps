@echo off
setlocal enabledelayedexpansion
set oldpid=65536
for /f "tokens=*" %%a in ('netstat -ano ^| find ":" ^| sort /+72') do (
  set string=%%a
  set processid=!string:~69,5!
  if not '!oldpid!'=='!processid!' (
    echo.
    wmic process where "ProcessID=!processid!" get ExecutablePath,CommandLine,Caption,ProcessID /format:list | find "="
    set oldpid=!processid!
    )
  echo   !string:~,69!
  )
