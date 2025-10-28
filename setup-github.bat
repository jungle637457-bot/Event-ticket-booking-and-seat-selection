@echo off
echo 🔧 GitHub Setup Helper

echo Installing GitHub CLI...
winget install GitHub.CLI

echo.
echo 🔐 Now authenticate with GitHub:
echo Run these commands:
echo.
echo   gh auth login
echo   git push origin main
echo.
echo Or run: push-to-github.bat
echo.
pause