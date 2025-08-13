#!/bin/bash

# Script pour pousser tout le code vers GitHub
echo "📤 Upload du code vers GitHub"
echo "============================="

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Lister les fichiers Python
echo -e "\n${BLUE}📁 Fichiers Python à ajouter:${NC}"
ls *.py 2>/dev/null | head -20

# Ajouter tous les fichiers importants
echo -e "\n${GREEN}➕ Ajout des fichiers...${NC}"

# Fichiers Python
git add *.py

# Fichiers de configuration
git add requirements.txt 2>/dev/null
git add requirements_*.txt 2>/dev/null
git add .gitignore 2>/dev/null
git add PROJECT_STRUCTURE.md 2>/dev/null

# Dossier .github
git add .github/ 2>/dev/null

# Dossier .streamlit
git add .streamlit/config.toml 2>/dev/null

# Scripts
git add *.sh 2>/dev/null

# Montrer le statut
echo -e "\n${YELLOW}📊 Fichiers à commiter:${NC}"
git status --short

# Compter les fichiers
file_count=$(git status --short | wc -l)
echo -e "\n${BLUE}Total: $file_count fichiers${NC}"

# Faire le commit
echo -e "\n${GREEN}💾 Création du commit...${NC}"
git commit -m "✨ Add complete YouTube Video Mixer Upload application

Core Features:
- Upload video mixer with Streamlit interface
- Face recognition and prioritization
- Text detection (avoid/crop/inpaint)
- Smart clip extraction algorithms
- Video assembly with materialization
- Audio integration support
- Logo overlay and tagline
- 9:16 vertical format for TikTok/Reels

Modules:
- upload_video_mixer.py: Main application
- video_extractor.py: Clip extraction
- video_assembler.py: Video concatenation
- video_analyzer.py: Content analysis
- video_normalizer.py: Format normalization
- face_detector.py: Face recognition
- text_detector.py: Text detection
- constants.py: Configuration
- utils.py: Helper functions

Tech Stack:
- Streamlit 1.29.0
- MoviePy 1.0.1
- OpenCV 4.8.1
- NumPy 1.26.0
- Face Recognition (optional)
- Pillow 10.0.1" || echo "Pas de nouveaux fichiers à commiter"

# Pousser vers GitHub
echo -e "\n${GREEN}🚀 Push vers GitHub...${NC}"
git push origin main

echo -e "\n${GREEN}✅ Terminé!${NC}"
echo -e "Vérifiez votre repo: ${BLUE}https://github.com/Timothee-col/youtube-video-mixer-upload${NC}"
