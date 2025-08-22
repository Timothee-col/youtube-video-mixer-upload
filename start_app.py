#!/usr/bin/env python3
"""
Script de démarrage pour Railway avec gestion correcte du port
"""
import os
import sys
import streamlit.web.cli as stcli

if __name__ == '__main__':
    # Récupérer le port depuis Railway
    port = os.environ.get('PORT', '8501')
    
    print(f"🚂 Démarrage sur Railway")
    print(f"📊 Port configuré: {port}")
    print(f"🌐 URL interne: http://0.0.0.0:{port}")
    
    # Configurer Streamlit via variables d'environnement
    os.environ['STREAMLIT_SERVER_PORT'] = port
    os.environ['STREAMLIT_SERVER_ADDRESS'] = '0.0.0.0'
    os.environ['STREAMLIT_SERVER_HEADLESS'] = 'true'
    os.environ['STREAMLIT_BROWSER_GATHER_USAGE_STATS'] = 'false'
    os.environ['STREAMLIT_SERVER_ENABLE_CORS'] = 'false'
    os.environ['STREAMLIT_SERVER_ENABLE_XSRF_PROTECTION'] = 'true'
    
    # Arguments pour Streamlit
    sys.argv = [
        'streamlit', 
        'run', 
        'upload_video_mixer.py',
        '--server.port', port,
        '--server.address', '0.0.0.0',
        '--server.headless', 'true'
    ]
    
    # Lancer Streamlit
    sys.exit(stcli.main())
