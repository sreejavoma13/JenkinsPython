# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

RUN apt-get update && apt-get install -y python3-venv
# Copy application code
COPY main.py test_main.py requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run unit tests
CMD ["python", "-m", "unittest", "test.py"]