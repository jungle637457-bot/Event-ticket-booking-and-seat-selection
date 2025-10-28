# Render Deployment Guide

This guide will help you deploy the Event Ticket Booking application to Render.

## Prerequisites

1. A [Render](https://render.com/) account
2. A MongoDB database (we recommend [MongoDB Atlas](https://www.mongodb.com/cloud/atlas))
3. API keys for Cloudinary and Stripe
4. An email service account (Gmail, SendGrid, etc.)

## Step-by-Step Deployment

### 1. Prepare External Services

#### MongoDB Database

1. Sign up for [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a new cluster
3. Configure network access to allow connections from anywhere (0.0.0.0/0)
4. Create a database user
5. Get your connection string from the "Connect" button
   - Choose "Connect your application"
   - Copy the connection string

#### Cloudinary

1. Sign up for a [Cloudinary](https://cloudinary.com/) account
2. Get your Cloud Name, API Key, and API Secret from the dashboard

#### Stripe

1. Sign up for a [Stripe](https://stripe.com/) account
2. Get your Publishable Key and Secret Key from the dashboard

### 2. Deploy to Render

#### Backend Service

1. Go to your Render Dashboard
2. Click "New+" and select "Web Service"
3. Connect your GitHub repository
4. Configure the service:
   - **Name**: `event-booking-backend`
   - **Region**: Choose the region closest to your users
   - **Branch**: `main`
   - **Root Directory**: Leave empty
   - **Environment**: Select "Docker"
   - **Dockerfile Path**: `Dockerfile.backend`
5. Click "Advanced" to add environment variables:
   ```
   NODE_ENV=production
   PORT=5000
   MONGO_URI=your_mongodb_connection_string
   JWT_SECRET=your_random_jwt_secret_key
   CLIENT_URL=https://event-booking-frontend.onrender.com
   CLOUDINARY_CLOUD_NAME=your_cloudinary_cloud_name
   CLOUDINARY_API_KEY=your_cloudinary_api_key
   CLOUDINARY_API_SECRET=your_cloudinary_api_secret
   STRIPE_SECRET_KEY=your_stripe_secret_key
   EMAIL_USER=your_email@example.com
   EMAIL_PASSWORD=your_email_password
   ```
6. Click "Create Web Service"

#### Frontend Service

1. Once the backend is created, go back to your Render Dashboard
2. Click "New+" and select "Static Site"
3. Connect the same GitHub repository
4. Configure the service:
   - **Name**: `event-booking-frontend`
   - **Build Command**: `npm install && npm run build`
   - **Publish Directory**: `dist`
5. Add environment variables under "Advanced":
   ```
   VITE_API_URL=https://event-booking-backend.onrender.com/api
   VITE_SOCKET_URL=https://event-booking-backend.onrender.com
   VITE_STRIPE_PUBLIC_KEY=your_stripe_public_key
   ```
6. Click "Create Static Site"

### 3. Update Environment Variables

After both services are deployed, you may need to update some environment variables:

1. In the backend service, update `CLIENT_URL` to point to your frontend URL
2. In the frontend service, update `VITE_API_URL` and `VITE_SOCKET_URL` to point to your backend URL

### 4. Manual Deployment (Alternative Method)

If automatic deployment doesn't work, you can manually deploy:

1. Clone your repository locally
2. Install the Render CLI: `npm install -g render-cli`
3. Log in to Render: `render login`
4. Deploy the backend:
   ```bash
   render deploy --name=event-booking-backend --type=web
   ```
5. Deploy the frontend:
   ```bash
   render deploy --name=event-booking-frontend --type=static
   ```

## Environment Variables Reference

### Backend Required Variables

| Variable                 | Description                 | Example                          |
| ------------------------ | --------------------------- | -------------------------------- |
| `NODE_ENV`               | Environment                 | `production`                     |
| `PORT`                   | Server port                 | `5000`                           |
| `MONGO_URI`              | MongoDB connection string   | `mongodb+srv://...`              |
| `JWT_SECRET`             | JWT signing key             | Random string                    |
| `CLIENT_URL`             | Frontend URL                | `https://your-site.onrender.com` |
| `CLOUDINARY_CLOUD_NAME`  | Cloudinary cloud name       | `yourcloudname`                  |
| `CLOUDINARY_API_KEY`     | Cloudinary API key          | `123456789012345`                |
| `CLOUDINARY_API_SECRET`  | Cloudinary API secret       | `abcdef123456`                   |
| `STRIPE_SECRET_KEY`      | Stripe secret key           | `sk_live_...`                    |
| `VITE_STRIPE_PUBLIC_KEY` | Stripe public key           | `pk_live_...`                    |
| `EMAIL_USER`             | Email username              | `you@gmail.com`                  |
| `EMAIL_PASSWORD`         | Email password/app password | `yourpassword`                   |

### Frontend Required Variables

| Variable                 | Description       | Example                                 |
| ------------------------ | ----------------- | --------------------------------------- |
| `VITE_API_URL`           | Backend API URL   | `https://your-backend.onrender.com/api` |
| `VITE_SOCKET_URL`        | WebSocket URL     | `https://your-backend.onrender.com`     |
| `VITE_STRIPE_PUBLIC_KEY` | Stripe public key | `pk_live_...`                           |

## Troubleshooting

### Common Issues

1. **CORS Errors**: Make sure `CLIENT_URL` in the backend matches your frontend URL
2. **Environment Variables Not Set**: Check that all required environment variables are configured
3. **Database Connection Failed**: Verify your MongoDB connection string
4. **Build Failures**: Check the build logs in Render dashboard

### Checking Logs

1. Go to your Render Dashboard
2. Select your service
3. Click on "Logs" tab
4. Look for error messages

### Redeploying

1. Make changes to your code and push to GitHub
2. Render will automatically redeploy
3. Or manually trigger a deploy from the Render dashboard

## Scaling

Render automatically scales your services based on traffic. For manual scaling:

1. Go to your service in Render Dashboard
2. Click "Settings"
3. Adjust the instance count and size as needed

## Custom Domain

To use a custom domain:

1. Purchase a domain from a registrar
2. In Render Dashboard, go to your service
3. Click "Settings" → "Custom Domains"
4. Add your domain
5. Follow the DNS instructions to verify ownership

## SSL Certificate

Render automatically provides SSL certificates for all services. No additional configuration is needed.

## Monitoring

Render provides basic monitoring:

- CPU and memory usage
- Response times
- Error rates

For advanced monitoring, consider integrating with third-party services like:

- New Relic
- Datadog
- Sentry
