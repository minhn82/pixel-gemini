FROM python:3.11-slim

# Cài đặt các package cần thiết cho Chrome, Selenium, và Telegram bot
RUN apt-get update && apt-get install -y \
    chromium-browser \
    chromium-driver \
    libxss1 \
    libappindicator1 \
    libindicator7 \
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
