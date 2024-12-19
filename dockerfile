# Use Python base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /flask-docker

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install Flask
RUN pip install scikit-learn

# Copy the application code to the container
COPY . .

ENV FLASK_APP=predict.py

# Command to run the Flask app
CMD ["python", "-m", "flask", "--app", "predict.py", "run", "--host=0.0.0.0"]
