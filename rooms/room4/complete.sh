#!/bin/bash

EXPECTED_ROOM=4
EXPECTED_HASH="323a9179795f934e429bb7e8bd08208c24806d67183a7b02cc87461c704a9825"

# 🚪 Level Lock — must be at the correct room
CURRENT=$(cat ../../.progress 2>/dev/null)
if [ "$CURRENT" != "$EXPECTED_ROOM" ]; then
    echo "🔒 Room 4 is locked! You are on room $CURRENT."
    exit 1
fi

# ❌ Flag Validation — must enter correct flag
read -p "🚩 Enter flag: " INPUT
INPUT_HASH=$(echo -n "$INPUT" | sha256sum | cut -d' ' -f1)

if [ "$INPUT_HASH" == "$EXPECTED_HASH" ]; then
    echo "✅ Correct! Room 4 cleared!"
    NEXT=$(( CURRENT + 1 ))
    echo $NEXT > ../../.progress
    echo "🚪 Room $(( EXPECTED_ROOM + 1 )) unlocked! Run: cd ../.. && ./start.sh"
else
    echo "❌ Wrong flag. Keep exploring!"
    exit 1
fi
