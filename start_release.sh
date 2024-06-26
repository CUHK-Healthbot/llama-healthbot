#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting Django production server..."
source env/bin/activate
cd backend
# Use Gunicorn for production
gunicorn myproject.wsgi:application --bind 0.0.0.0:8000 &

echo "Serving React build files..."
cd ../frontend
# Assuming the build files are served by a simple HTTP server for demonstration
npx serve -s build &

echo "Servers are running. To stop the servers, use 'kill %1 %2' to terminate the background processes."
