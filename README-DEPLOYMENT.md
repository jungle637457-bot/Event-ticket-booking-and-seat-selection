# Event Ticket Booking - Deployment Guide

## 🚀 Quick Start

### Prerequisites
- Docker Desktop installed
- Git installed

### Deploy Locally
```bash
# Clone the repository
git clone https://github.com/its1gokul/Event-ticket-booking-and-seat-selection-.git
cd Event-ticket-booking-and-seat-selection-

# Deploy with Docker
deploy.bat
```

### Access Application
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000
- **MongoDB**: localhost:27017

## 🔧 Configuration

### Environment Setup
1. Copy `.env.production` to `.env`
2. Update with your service credentials:

```env
# Cloudinary (Image uploads)
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# Stripe (Payments)
STRIPE_SECRET_KEY=sk_live_your_key
VITE_STRIPE_PUBLIC_KEY=pk_live_your_key

# Email (Notifications)
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_app_password
```

## 🏗️ Architecture

```
Frontend (React + Vite) → Nginx → Backend (Node.js + Express)
                                      ↓
                                  MongoDB
                                      ↓
                               Socket.io (Real-time)
```

## 📦 Services

- **Frontend**: React with TailwindCSS, real-time seat selection
- **Backend**: Node.js API with JWT authentication
- **Database**: MongoDB with optimized indexes
- **Real-time**: Socket.io for live updates
- **Payments**: Stripe integration
- **Images**: Cloudinary integration

## 🛠️ Development

### Local Development
```bash
npm run dev          # Start both frontend and backend
npm run server       # Backend only
npm run client       # Frontend only
```

### Docker Commands
```bash
docker-compose up -d              # Start services
docker-compose down               # Stop services
docker-compose logs -f            # View logs
docker-compose ps                 # Check status
```

## 🔒 Security Features

- JWT authentication
- Rate limiting
- CORS protection
- Helmet security headers
- Input validation
- Password hashing with bcrypt

## 📱 Features

- **Event Management**: Create, edit, delete events
- **Seat Selection**: Interactive seat map with real-time updates
- **Payment Processing**: Secure Stripe integration
- **User Authentication**: Register, login, profile management
- **Admin Dashboard**: Event analytics and management
- **Email Notifications**: Booking confirmations
- **QR Code Tickets**: Digital ticket generation
- **Responsive Design**: Mobile-friendly interface

## 🚀 Production Deployment

For production deployment on cloud platforms:

1. **Update environment variables** for production
2. **Configure SSL certificates**
3. **Set up domain name**
4. **Configure email service**
5. **Set up monitoring and backups**

## 📞 Support

For issues or questions:
1. Check the logs: `docker-compose logs`
2. Verify environment configuration
3. Ensure all services are running
4. Check network connectivity

## 🎯 Next Steps

After deployment:
1. Create admin user account
2. Add sample events
3. Test payment flow
4. Configure email templates
5. Set up monitoring

---

**Happy Booking! 🎫**