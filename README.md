# highnum
Windows CMD to find the highest numbered directory

This is not my work.  Full credit goes to Berend.

https://superuser.com/users/361452/berend

https://superuser.com/questions/1262673/windows-get-highest-numerical-folder-number-in-directory-from-command-line


I'm sure there's a better way, but this seems to work. For positive values anyway.

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
First we move in the whatever folder.

Then we use for /d to loop over all subdirectories, and subtract the 'value' of the foldername (%%~nd, where %%d is the full pathname, and ~n extracts just the name) from the current highest (!h!).

If the result x is smaller than 0 (starts with -) it means we found a higher value and we overwrite !h!.

Finally we pop back into the folder where we started.
