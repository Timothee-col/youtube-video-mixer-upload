#!/bin/bash

echo "🔄 Switching to Nixpacks for Railway"
echo "===================================="

# Sauvegarder le Dockerfile
if [ -f "Dockerfile" ]; then
    echo "📦 Backing up Dockerfile..."
    mv Dockerfile Dockerfile.backup
fi

# S'assurer que nixpacks.toml existe
if [ ! -f "nixpacks.toml" ]; then
    echo "❌ nixpacks.toml not found!"
    exit 1
fi

# Git operations
echo "📤 Committing changes..."
git add nixpacks.toml
git add -u  # Add modified/deleted files
git commit -m "🚂 Switch to Nixpacks for Railway deployment

- Remove Dockerfile temporarily
- Use nixpacks.toml configuration
- Automatic Python and ffmpeg setup
- Simplified deployment process"

echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Done! Railway will now use Nixpacks"
echo ""
echo "📝 Notes:"
echo "- Railway will auto-detect Python"
echo "- ffmpeg will be installed automatically"
echo "- PORT will be handled correctly"
echo ""
echo "To restore Dockerfile later:"
echo "  mv Dockerfile.backup Dockerfile"
echo "  git add Dockerfile"
echo "  git commit -m 'Restore Dockerfile'"
