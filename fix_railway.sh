#!/bin/bash

echo "🔧 Fix Railway Port Issue"
echo "========================"

# Utiliser le bon Dockerfile
cp Dockerfile.railway Dockerfile

# Git
git add Dockerfile start_app.py railway.json
git commit -m "Fix: Railway port configuration"
git push origin main

echo "✅ Pushed! Railway will redeploy automatically"
echo ""
echo "⚠️  IMPORTANT:"
echo "1. Go to Railway dashboard"
echo "2. Remove all environment variables except those Railway sets"
echo "3. Wait for redeploy"
echo ""
echo "The app will be available at your Railway domain"
