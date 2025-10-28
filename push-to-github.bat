@echo off
echo 🚀 Pushing Event Ticket Booking Project to GitHub

echo 📋 Current repository status:
git remote -v
echo.

echo 📦 Files ready to push:
git status --short
echo.

echo 🔐 Attempting to push to GitHub...
echo If authentication fails, you'll need to:
echo 1. Install GitHub CLI: winget install GitHub.CLI
echo 2. Run: gh auth login
echo 3. Then run this script again
echo.

REM Try to push
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ Successfully pushed to GitHub!
    echo 🌐 Your repository: https://github.com/its1gokul/Event-ticket-booking-and-seat-selection-
    echo.
    echo 🚀 Next steps:
    echo 1. Visit your GitHub repository
    echo 2. Clone it anywhere: git clone https://github.com/its1gokul/Event-ticket-booking-and-seat-selection-.git
    echo 3. Run: deploy.bat
    echo 4. Access your app at http://localhost:3000
) else (
    echo.
    echo ❌ Push failed - Authentication required
    echo.
    echo 🔧 Quick fix options:
    echo.
    echo Option 1 - GitHub CLI (Recommended):
    echo   winget install GitHub.CLI
    echo   gh auth login
    echo   git push origin main
    echo.
    echo Option 2 - Personal Access Token:
    echo   1. Go to GitHub.com → Settings → Developer settings → Personal access tokens
    echo   2. Generate new token with 'repo' permissions
    echo   3. Run: git remote set-url origin https://its1gokul:YOUR_TOKEN@github.com/its1gokul/Event-ticket-booking-and-seat-selection-.git
    echo   4. Run: git push origin main
    echo.
    echo Option 3 - GitHub Desktop:
    echo   1. Download GitHub Desktop
    echo   2. Sign in with your account
    echo   3. Open this repository
    echo   4. Push changes
)

echo.
pause