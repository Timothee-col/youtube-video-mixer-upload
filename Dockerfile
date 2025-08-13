# Dockerfile optimisé pour Railway
FROM python:3.11-slim

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Créer le répertoire de travail
WORKDIR /app

# Copier les requirements
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier toute l'application
COPY . .

# Créer un répertoire pour les fichiers temporaires
RUN mkdir -p /app/temp

# Variables d'environnement
ENV PYTHONUNBUFFERED=1
ENV IS_RAILWAY=true
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_BROWSER_GATHER_USAGE_STATS=false

# Script de démarrage
RUN echo '#!/bin/sh\nexec streamlit run upload_video_mixer.py --server.port=${PORT:-8501} --server.address=0.0.0.0 --server.headless=true' > /app/start.sh && \
    chmod +x /app/start.sh

# Exposer le port (Railway gère ça automatiquement)
EXPOSE 8501

# Utiliser le script de démarrage
ENTRYPOINT ["/bin/sh", "/app/start.sh"]
