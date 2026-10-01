FROM python:3.11-slim

# Update package list trước
RUN apt-get update

# Cài đặt Chrome và dependencies
RUN apt-get install -y \
    chromium \
    chromium-driver \
    fonts-liberation \
    xdg-utils \
    wget \
    ca-certificates \
    fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
