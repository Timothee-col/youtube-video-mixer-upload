FROM python:3.11

# Installer les dépendances pour compiler dlib (packages compatibles)
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libx11-dev \
    libopenblas-dev \
    liblapack-dev \
    libgtk-3-dev \
    python3-dev \
    ffmpeg \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Mettre à jour pip et installer les outils de build
RUN pip install --upgrade pip setuptools wheel

# Installer numpy d'abord (requis par dlib)
RUN pip install numpy

# Installer dlib (sans version spécifique pour avoir la dernière compatible)
RUN pip install dlib

# Installer face_recognition
RUN pip install face-recognition

# Copier et installer les autres dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier l'application
COPY . .

ENV PYTHONUNBUFFERED=1

CMD ["python", "start.py"]
