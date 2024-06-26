# CUHK-Llama HealthBot

## Overview

CUHK-Llama HealthBot is a health chatbot developed by students from the Chinese University of Hong Kong (CUHK) and exchange students, supervised by Prof. Li Yu. The chatbot leverages the Llama model for natural language processing to provide users with reliable responses to minor medical questions. This project aims to improve accessibility to medical information via a user-friendly interface integrated with WeChat.

## Project Structure

- **Backend**: Django REST API
- **Frontend**: React
- **Database**: PostgreSQL
- **Cache**: Redis
- **Model**: Llama Model deployed on two RTX 3090 GPUs

## Prerequisites

- Python 3.8 or higher
- Node.js and npm
- PostgreSQL
- Redis
- CUDA and cuDNN (for GPU support)

## Setup Instructions

### 1. Backend Setup (Django)

#### Create a Virtual Environment

```sh
python -m venv env
source env/bin/activate  # On Windows, use `.\env\Scripts\activate`
```

#### Install Dependencies

```sh
pip install -r requirements.txt
```

#### Configure Database
Edit myproject/settings.py to configure the PostgreSQL database:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'your_db_name',
        'USER': 'your_db_user',
        'PASSWORD': 'your_db_password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

#### Apply Migrations
```sh
python manage.py migrate
```
#### Create Superuser

```sh
python manage.py createsuperuser
```
#### Run Development Server
```sh
python manage.py runserver
```

### 2. Frontend Setup (React)

#### Navigate to Frontend Directory
```sh
cd frontend
```

#### Install Dependencies
```sh
npm install
```

#### Start Development Server
```sh
npm start
```

### 3. Redis Setup

#### Install Redis
Follow the instructions on the Redis website to install Redis on your system.

#### Start Redis Server
```sh
redis-server
```

### 4. Model Setup (Llama)

#### Install CUDA and cuDNN
Follow the instructions on the NVIDIA website to install CUDA and cuDNN.

#### Download and Set Up Llama Model
Download the Llama model from the official repository and set it up according to the provided instructions.

### 5. Running the Entire Project
Ensure that the Django server, React frontend, Redis server, and Llama model are all running. Access the frontend through the local development server, and it should be able to interact with the backend API.


## Project Configuration
#### Environment Variables
Create a .env file in the root directory to manage sensitive information:

```env
SECRET_KEY=your_secret_key
DEBUG=True
ALLOWED_HOSTS=localhost, 127.0.0.1
DATABASE_URL=postgres://your_db_user:your_db_password@localhost/your_db_name
REDIS_URL=redis://localhost:6379
```

#### API Endpoints
- GET /api/example/: Example endpoint to test the setup

## Deployment

#### Frontend Deployment
Build the React app for production:

```sh
npm run build
```
Deploy the build folder to your hosting service.

#### Backend Deployment
Deploy the Django application using a web server like Gunicorn and a reverse proxy like Nginx. Ensure that the environment variables are properly set up in the deployment environment.

#### Model Deployment
Ensure that the server has the required GPU support and that the Llama model is properly set up. Run the model as a service that the Django backend can interact with.

#### Database Deployment
Set up PostgreSQL on a cloud database service and migrate your local database to the cloud. Update the DATABASE_URL in your environment variables to point to the cloud database.

### Contributing
1. Fork the repository.
2. Create a new branch (git checkout -b feature-branch).
3. Commit your changes (git commit -m 'Add some feature').
4. Push to the branch (git push origin feature-branch).
5. Create a new Pull Request.

### Contact
For any questions or additional information, please contact:

Project Developer: Xiangyu (Terry Tu)
GitHub: TEJMaster
Email: xiangyu.tu@mail.utoronto.ca

### License
This project is licensed under the MIT License - see the LICENSE file for details.