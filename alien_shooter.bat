@echo off
title Alien Shooter Game
color 0A
mode 50,15
setlocal enabledelayedexpansion

:menu
cls
echo ===========================
echo         ALIEN SHOOTER       
echo ===========================
echo 1. Start Game
echo 2. Exit
set /p choice=Choose an option (1/2): 

if "%choice%"=="1" goto start
if "%choice%"=="2" exit
goto menu

:start
cls
echo Get ready! Press [SPACE] to shoot aliens!
timeout /t 3 >nul

set score=0

:game_loop
cls
set /a alien=%random% %% 5 + 1
echo An alien appears!
echo ---------------
echo |     (o_o)   |
echo |     / | \   |
echo |      / \    |
echo ---------------

set /a reaction_time=%random% %% 3 + 2
choice /t %reaction_time% /d N /c YN /m "Press [Y] to shoot!"

if errorlevel 2 (
    echo The alien got you! Game Over.
    echo Your final score: %score%
    pause
    goto menu
) else (
    echo BOOM! Alien destroyed!
    set /a score+=1
    echo Score: %score%
    timeout /t 1 >nul
    goto game_loop
)