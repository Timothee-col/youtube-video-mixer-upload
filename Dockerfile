FROM python:3.11

# Installer TOUTES les dépendances pour compiler dlib
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libx11-dev \
    libatlas-base-dev \
    libgtk-3-dev \
    libboost-python-dev \
    libopenblas-dev \
    liblapack-dev \
    libhdf5-dev \
    python3-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Mettre à jour pip
RUN pip install --upgrade pip setuptools wheel

# Installer numpy d'abord (requis par dlib)
RUN pip install numpy

# Installer dlib depuis les wheels pré-compilés ou compiler
RUN pip install dlib --verbose

# Installer face_recognition
RUN pip install face-recognition

# Copier et installer les autres dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier l'application
COPY . .

ENV PYTHONUNBUFFERED=1

CMD ["python", "start.py"]
