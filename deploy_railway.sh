#!/bin/bash

echo "🚂 Préparation pour Railway"
echo "=========================="

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Ajouter les fichiers Railway
echo -e "${GREEN}📦 Ajout des fichiers Railway...${NC}"
git add Dockerfile .dockerignore railway.json railway.toml railway_start.py RAILWAY_DEPLOY.md constants.py

# Commiter
echo -e "${GREEN}💾 Commit...${NC}"
git commit -m "🚂 Railway deployment configuration" || echo "Pas de changements"

# Pousher
echo -e "${GREEN}🚀 Push vers GitHub...${NC}"
git push origin main

echo -e "\n${GREEN}✅ Prêt pour Railway!${NC}"
echo -e "\n${BLUE}Prochaines étapes:${NC}"
echo "1. Allez sur https://railway.app/new"
echo "2. Connectez votre repo GitHub"
echo "3. Railway déploiera automatiquement!"
echo ""
echo -e "${BLUE}📚 Guide complet: RAILWAY_DEPLOY.md${NC}"
