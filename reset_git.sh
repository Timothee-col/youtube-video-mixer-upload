#!/bin/bash

# Script pour réinitialiser Git et créer un nouveau repo
echo "🔄 Réinitialisation du repo Git..."
echo "================================="

# Couleurs pour l'output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Demander confirmation
echo -e "${YELLOW}⚠️  Ceci va réinitialiser l'historique Git!${NC}"
read -p "Êtes-vous sûr de vouloir continuer? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${RED}Annulé.${NC}"
    exit 1
fi

# Vérifier le remote actuel
echo -e "\n${YELLOW}Remote actuel:${NC}"
git remote -v

# Sauvegarder l'ancien .git
if [ -d ".git" ]; then
    echo -e "\n${GREEN}📦 Sauvegarde de l'ancien .git...${NC}"
    mv .git .git.backup.$(date +%Y%m%d_%H%M%S)
fi

# Réinitialiser Git
echo -e "\n${GREEN}🎯 Initialisation d'un nouveau repo Git...${NC}"
git init

# Ajouter tous les fichiers
echo -e "\n${GREEN}📝 Ajout de tous les fichiers...${NC}"
git add .

# Commit initial
echo -e "\n${GREEN}💾 Création du commit initial...${NC}"
git commit -m "🎬 Initial commit: YouTube Video Mixer Upload Pro

Features:
- Direct video upload (MP4, MOV, AVI, WEBM, MKV)
- AI-powered face recognition and prioritization
- Smart clip extraction with multiple analysis modes
- Text detection and removal (avoid/crop/inpaint)
- Automatic 9:16 vertical format conversion
- Audio integration (voiceover/music)
- Logo overlay and video tagline support
- Smart shuffle and diversity algorithms
- High-quality Lanczos resizing option
- Batch processing support

Tech Stack:
- Streamlit for web interface
- MoviePy for video processing
- OpenCV for computer vision
- face-recognition for facial detection
- Custom algorithms for clip scoring

Author: Timothée Colinet
License: MIT"

# Créer la branche main
git branch -M main

echo -e "\n${GREEN}✅ Réinitialisation terminée!${NC}"
echo -e "\n${YELLOW}Prochaines étapes:${NC}"
echo "1. Créez un nouveau repo sur GitHub: https://github.com/new"
echo "   - Nom: youtube-video-mixer-upload"
echo "   - NE PAS initialiser avec README"
echo ""
echo "2. Ajoutez le remote:"
echo -e "   ${GREEN}git remote add origin https://github.com/YOUR_USERNAME/youtube-video-mixer-upload.git${NC}"
echo ""
echo "3. Poussez vers GitHub:"
echo -e "   ${GREEN}git push -u origin main${NC}"
echo ""
echo -e "${YELLOW}📋 Status actuel:${NC}"
git status --short
echo ""
echo -e "${YELLOW}📊 Statistiques:${NC}"
echo "Fichiers: $(git ls-files | wc -l)"
echo "Taille totale: $(du -sh . | cut -f1)"
