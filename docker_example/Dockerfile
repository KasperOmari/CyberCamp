# Use an official lightweight Python image
FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get install -y libncurses5-dev

# Copy the Snake game
COPY snake.py /snake.py

# Set the command to run the game
CMD ["python", "/snake.py"]
