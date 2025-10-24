# Use an official Python runtime as a parent image
FROM python:3.10-slim

# set workdir
WORKDIR /app

# install build deps and remove apt lists to keep image small
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Copy requirements first (cached layer)
COPY /requirements.txt .

# Install python deps
RUN pip install --no-cache-dir -r requirements.txt

# Copy app sources
COPY app /app

# Environment
ENV PORT=80
EXPOSE 80

# Use gunicorn to serve the app (production)
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app", "--workers", "2"]
