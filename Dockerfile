FROM python:3.11-slim

# Installer les dépendances système nécessaires pour dlib et face_recognition
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    ffmpeg \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installer dlib et face_recognition EN PREMIER (c'est le plus long)
RUN pip install --no-cache-dir dlib==19.24.0
RUN pip install --no-cache-dir face-recognition==1.3.0

# Copier requirements et installer le reste
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier toute l'application
COPY . .

# Variables d'environnement
ENV PYTHONUNBUFFERED=1

# Utiliser le script Python pour démarrer
CMD ["python", "start.py"]
