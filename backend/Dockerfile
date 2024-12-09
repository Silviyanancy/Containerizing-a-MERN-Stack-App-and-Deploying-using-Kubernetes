# Use the official Python image
FROM python:3.12

# Set the working directory
WORKDIR /app

# Copy the backend files into the container
COPY . .

# Install required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the Flask app runs on
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
