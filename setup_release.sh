#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting release setup..."

# 1. Setup Backend (Django)

echo "Setting up Python virtual environment..."
python3 -m venv env
source env/bin/activate

echo "Installing backend dependencies from requirements.txt..."
pip install -r backend/requirements.txt

echo "Applying migrations..."
cd backend
python manage.py migrate

echo "Creating Django superuser..."
python manage.py createsuperuser

# 2. Setup Frontend (React)

echo "Setting up frontend..."
cd ../frontend
npm install

echo "Building frontend for production..."
npm run build

echo "Setup complete. Please follow the instructions to start the servers by running 'start_release_servers.sh'."

echo "Don't forget to set up your environment variables in a .env file."
echo "Example .env file:"
echo "SECRET_KEY=your_secret_key"
echo "DEBUG=False"
echo "ALLOWED_HOSTS=your_production_domain, localhost"
