#!/bin/bash
set -e

# Clone or update the pitch deck
if [ ! -d "app-main" ]; then
    echo "Cloning Kushifypitchdeck → app-main/"
    git clone git@github.com:npaul429/Kushifypitchdeck.git app-main

    # Add figma:asset alias needed by the pitch deck
    sed -i.bak "s|'@': path.resolve(__dirname, './src'),|'@': path.resolve(__dirname, './src'), 'figma:asset': path.resolve(__dirname, './src/assets'),|" app-main/vite.config.ts
    rm -f app-main/vite.config.ts.bak
else
    echo "app-main/ exists, pulling latest..."
    cd app-main && git pull && cd ..
fi

# Clone or update the card game
if [ ! -d "app-play" ]; then
    echo "Cloning kushifycardgame → app-play/"
    git clone -b Ralph-loop-changes git@github.com:npaul429/kushifycardgame.git app-play
    cp app-play/.env.local.backup app-play/.env.local
else
    echo "app-play/ exists, pulling latest..."
    cd app-play && git pull && cd ..
fi

echo ""
echo "Done. Run:  docker compose up --build"
