# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy application code
COPY app.py test.py requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run unit tests
CMD ["python", "-m", "unittest", "test.py"]