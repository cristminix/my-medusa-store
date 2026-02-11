#!/bin/sh

# Run migrations and start server
echo "Running database migrations..."
npm run medusa db:migrate

echo "Seeding database..."
# pnpm seed || echo "Seeding failed, continuing..."

echo "Starting Medusa development server..."
# pnpm run build
npm run start
