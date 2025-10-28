@echo off
echo 🚀 Auto GitHub Deploy - Event Ticket Booking

echo Step 1: Authenticating with GitHub...
"C:\Program Files\GitHub CLI\gh.exe" auth login --web

echo Step 2: Pushing to repository...
git push origin main

if %errorlevel% equ 0 (
    echo ✅ SUCCESS! Project pushed to GitHub
    echo 🌐 Repository: https://github.com/its1gokul/Event-ticket-booking-and-seat-selection-
    echo.
    echo 🚀 Your app is now deployable anywhere with:
    echo    git clone https://github.com/its1gokul/Event-ticket-booking-and-seat-selection-.git
    echo    cd Event-ticket-booking-and-seat-selection-
    echo    deploy.bat
    echo.
    echo 🎯 App will run at: http://localhost:3000
) else (
    echo ❌ Push failed. Please check your authentication.
)

pause