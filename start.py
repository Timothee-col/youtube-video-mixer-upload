import os
import subprocess
import sys

# Récupérer le port depuis Railway
port = os.environ.get('PORT', '8501')
print(f"🚀 Starting Streamlit on port {port}")

# Commande Streamlit avec les bons paramètres
cmd = [
    'streamlit', 'run', 'upload_video_mixer.py',
    '--server.port', port,
    '--server.address', '0.0.0.0',
    '--server.fileWatcherType', 'none',
    '--browser.gatherUsageStats', 'false',
    '--server.enableCORS', 'true',
    '--server.enableXsrfProtection', 'false'
]

# Lancer Streamlit
subprocess.run(cmd)
