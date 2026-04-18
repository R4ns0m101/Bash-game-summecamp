#!/bin/bash
export PATH="$(pwd)/bin:$PATH"
export ROLE=player

# Initialize progress if not exists
if [ ! -f ".progress" ]; then
    echo "1" > .progress
fi

echo "🏰 Welcome to BashDungeon"
echo "You feel a cold breeze..."
sleep 1

./engine.sh
