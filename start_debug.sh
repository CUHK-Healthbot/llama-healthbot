#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting Django development server..."
source env/bin/activate
cd backend
python manage.py runserver &

echo "Starting React development server..."
cd ../frontend
npm start &

echo "Servers are running. To stop the servers, use 'kill %1 %2' to terminate the background processes."
