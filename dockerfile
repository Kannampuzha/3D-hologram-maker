# Use the official Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy project files to the container
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential cmake pkg-config \
    libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev \
    libjpeg-dev libpng-dev libtiff-dev \
    libxvidcore-dev libx264-dev libv4l-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install opencv-python opencv-contrib-python numpy

# Define the command to run your script
CMD ["python", "3DHologram.py"]
