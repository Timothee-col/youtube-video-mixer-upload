#!/usr/bin/env python3
import os
import subprocess

# FORCER l'utilisation du PORT de Railway
port = os.environ.get('PORT', '8501')
print(f"🚀 Starting on Railway PORT: {port}")

# Lancer Streamlit avec le bon port
cmd = [
    'streamlit', 'run', 'upload_video_mixer.py',
    '--server.port', port,
    '--server.address', '0.0.0.0',
    '--server.headless', 'true',
    '--browser.gatherUsageStats', 'false',
    '--server.enableCORS', 'true',
    '--server.enableXsrfProtection', 'false',
    '--server.maxUploadSize', '500'
]

print(f"Command: {' '.join(cmd)}")
subprocess.run(cmd)
