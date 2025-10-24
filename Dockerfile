# Use official Python slim image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY app ./app

# Set environment variables
ENV PORT=80
EXPOSE 80

# Run the app with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app.main:app"]
