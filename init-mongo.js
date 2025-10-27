// MongoDB initialization script
db = db.getSiblingDB('event-booking');

// Create application user
db.createUser({
  user: 'app-user',
  pwd: 'app-password',
  roles: [
    {
      role: 'readWrite',
      db: 'event-booking'
    }
  ]
});

// Create indexes for better performance
db.users.createIndex({ email: 1 }, { unique: true });
db.events.createIndex({ date: 1 });
db.events.createIndex({ category: 1 });
db.events.createIndex({ location: 1 });
db.bookings.createIndex({ user: 1 });
db.bookings.createIndex({ event: 1 });
db.bookings.createIndex({ createdAt: -1 });

print('Database initialized successfully!');