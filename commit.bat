::Github
Title Github
mode con:cols=75 lines=20

@echo off
set /p input="Enter commit message: "
if "%input%" == "%input%" goto Commit

:Commit
    git add .
    if "%input%" == "" ( git commit -m "Bug fixes" ) else ( git commit -m "%input%" )
    git push -f origin dev-0.4.0

exit