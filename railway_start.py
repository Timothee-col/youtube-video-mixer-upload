#!/usr/bin/env python3
"""
Script de démarrage pour Railway
Gère correctement le port dynamique
"""
import os
import sys
import subprocess

def main():
    # Récupérer le port depuis Railway (ou utiliser 8501 par défaut)
    port = os.environ.get('PORT', '8501')
    
    # Optimisations pour Railway
    os.environ['IMAGEIO_FFMPEG_EXE'] = 'ffmpeg'
    os.environ['OPENCV_VIDEOIO_PRIORITY_FFMPEG'] = '1'
    # Supprimer les warnings FFmpeg
    os.environ['FFREPORT'] = 'level=quiet'
    os.environ['AV_LOG_FORCE_NOCOLOR'] = '1'
    
    print(f"🚂 Démarrage sur Railway - Port {port}")
    print(f"📊 Variables d'environnement:")
    print(f"  - PORT: {port}")
    print(f"  - IS_RAILWAY: {os.environ.get('IS_RAILWAY', 'false')}")
    print(f"  - PYTHONUNBUFFERED: {os.environ.get('PYTHONUNBUFFERED', '0')}")
    print(f"  - Threads limités pour économiser la mémoire")
    
    # Commande Streamlit
    cmd = [
        'streamlit', 
        'run', 
        'upload_video_mixer.py',
        '--server.port', port,
        '--server.address', '0.0.0.0',
        '--server.headless', 'true',
        '--browser.gatherUsageStats', 'false',
        '--server.maxUploadSize', '500',
        '--server.enableCORS', 'false',
        '--server.enableXsrfProtection', 'true'
    ]
    
    print(f"🎬 Lancement de l'application...")
    print(f"Commande: {' '.join(cmd)}")
    
    # Lancer Streamlit
    try:
        subprocess.run(cmd)
    except KeyboardInterrupt:
        print("\n👋 Arrêt de l'application...")
        sys.exit(0)
    except Exception as e:
        print(f"❌ Erreur: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
