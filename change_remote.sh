#!/bin/bash

# Script simple pour délier l'ancien repo et ajouter le nouveau
echo "🔄 Changement de remote Git"
echo "==========================="

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Afficher le remote actuel
echo -e "\n${YELLOW}Remote actuel:${NC}"
git remote -v

# Supprimer l'ancien remote
echo -e "\n${GREEN}🗑️  Suppression de l'ancien remote...${NC}"
git remote remove origin

# Demander le nom d'utilisateur GitHub
echo -e "\n${YELLOW}Entrez votre nom d'utilisateur GitHub:${NC}"
read github_username

# Ajouter le nouveau remote
echo -e "\n${GREEN}➕ Ajout du nouveau remote...${NC}"
git remote add origin https://github.com/$github_username/youtube-video-mixer-upload.git

# Vérifier
echo -e "\n${GREEN}✅ Nouveau remote configuré:${NC}"
git remote -v

echo -e "\n${YELLOW}Prochaines étapes:${NC}"
echo "1. Créez le repo sur GitHub: https://github.com/new"
echo "   Nom: youtube-video-mixer-upload"
echo "2. Poussez avec: git push -u origin main"
