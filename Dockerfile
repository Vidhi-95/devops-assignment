# Python base image
FROM python:3.11-slim

# Setting working directory
WORKDIR /app

COPY requirements.txt .

# Installing dependencies
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy application code
COPY helloapp/ ./helloapp/

EXPOSE 8080

# Running the app with 2 Gunicorn workers
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "-w", "2", "helloapp.app:app"]
