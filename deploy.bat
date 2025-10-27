@echo off
echo 🚀 Starting Event Ticket Booking Application Deployment...

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker is not installed. Please install Docker Desktop first.
    pause
    exit /b 1
)

REM Check if Docker Compose is available
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose is not available. Please install Docker Desktop with Compose.
    pause
    exit /b 1
)

REM Create .env file if it doesn't exist
if not exist .env (
    echo 📝 Creating .env file from template...
    copy .env.production .env
    echo ⚠️  Please edit .env file with your actual service credentials before running again.
    echo    Required: Cloudinary, Stripe, and Email configurations
    pause
    exit /b 1
)

REM Stop existing containers
echo 🛑 Stopping existing containers...
docker-compose down

REM Build and start services
echo 🏗️  Building and starting services...
docker-compose up --build -d

REM Wait for services to be ready
echo ⏳ Waiting for services to start...
timeout /t 30 /nobreak >nul

REM Check if services are running
echo 🔍 Checking service status...
docker-compose ps

REM Show logs
echo 📋 Recent logs:
docker-compose logs --tail=20

echo.
echo ✅ Deployment completed!
echo.
echo 🌐 Application URLs:
echo    Frontend: http://localhost:3000
echo    Backend API: http://localhost:5000
echo    MongoDB: localhost:27017
echo.
echo 📚 Useful commands:
echo    View logs: docker-compose logs -f
echo    Stop services: docker-compose down
echo    Restart services: docker-compose restart
echo    Update services: docker-compose up --build -d
echo.
echo ⚠️  Don't forget to:
echo    1. Update .env with your actual service credentials
echo    2. Configure your domain/SSL if deploying to production
echo    3. Set up proper backups for MongoDB data
echo.
pause