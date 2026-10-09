# Use Debian Bookworm based image (packages are active and up-to-date)
FROM python:3.10-slim-bookworm

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# Run the Extractor module
CMD ["sh", "-c", "python -m Extractor"]
