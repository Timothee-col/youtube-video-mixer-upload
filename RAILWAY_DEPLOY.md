# 🚂 Guide de Déploiement Railway

## 📋 Prérequis
- Compte Railway (https://railway.app)
- Repo GitHub configuré
- Code pushé sur GitHub

## 🚀 Déploiement Étape par Étape

### 1. Connecter GitHub à Railway

1. Allez sur [Railway Dashboard](https://railway.app/dashboard)
2. Cliquez sur **"New Project"**
3. Choisissez **"Deploy from GitHub repo"**
4. Autorisez Railway à accéder à votre GitHub
5. Sélectionnez le repo `youtube-video-mixer-upload`

### 2. Configuration du Projet

Railway détectera automatiquement le Dockerfile et commencera le build.

### 3. Variables d'Environnement

Dans l'onglet **Variables** de votre projet Railway, ajoutez :

```env
IS_RAILWAY=true
PORT=8501
PYTHONUNBUFFERED=1
STREAMLIT_SERVER_HEADLESS=true
STREAMLIT_BROWSER_GATHER_USAGE_STATS=false
```

### 4. Domaine Personnalisé (Optionnel)

1. Allez dans **Settings** → **Domains**
2. Cliquez sur **"Generate Domain"**
3. Ou ajoutez votre propre domaine

## ⚙️ Configuration Avancée

### Limites de Ressources

Dans **Settings**, vous pouvez configurer :
- **Memory**: 2GB minimum recommandé
- **CPU**: 1 vCPU minimum
- **Disk**: 10GB recommandé

### Redémarrage Automatique

Le projet est configuré pour redémarrer automatiquement en cas d'échec (max 3 tentatives).

## 🔍 Debugging

### Voir les Logs

```bash
# Via Railway CLI
railway logs

# Ou dans le dashboard Railway
Settings → Logs
```

### Problèmes Courants

#### Port non reconnu
- Vérifiez que la variable `PORT` est bien définie
- Railway fournit automatiquement cette variable

#### Mémoire insuffisante
- Augmentez la limite mémoire dans Settings
- Réduisez le nombre de clips traités simultanément

#### Erreur MoviePy
- ffmpeg est déjà inclus dans le Dockerfile
- Vérifiez les logs pour plus de détails

## 📊 Monitoring

Railway fournit automatiquement :
- Métriques d'utilisation
- Logs en temps réel
- Alertes (si configurées)

## 🔄 Mise à Jour

Pour mettre à jour l'application :

```bash
# 1. Faire vos modifications localement
git add .
git commit -m "Update: description"
git push origin main

# 2. Railway redéploiera automatiquement
```

## 💰 Coûts Estimés

- **Hobby Plan**: $5/mois (500 heures d'exécution)
- **Pro Plan**: $20/mois (usage illimité)
- Stockage supplémentaire si nécessaire

## 🆘 Support

- [Documentation Railway](https://docs.railway.app)
- [Discord Railway](https://discord.gg/railway)
- Issues GitHub du projet

## ✅ Checklist de Déploiement

- [ ] Dockerfile présent et testé
- [ ] railway.json configuré
- [ ] Variables d'environnement définies
- [ ] Repo GitHub connecté
- [ ] Domaine généré/configuré
- [ ] Ressources allouées suffisantes
- [ ] Tests de l'application en production

## 🎉 Succès !

Une fois déployé, votre application sera accessible à :
```
https://[votre-app].railway.app
```

Ou sur votre domaine personnalisé si configuré.
