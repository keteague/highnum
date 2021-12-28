@echo off
SETLOCAL EnableDelayedExpansion

pushd whatever
set h=0
for /d %%d in (*.*) do (    
    set /a x=!h!-%%~nd  
    if "!x:~0,1!"=="-" set h=%%d    
)
popd

echo Highest value is !h!
