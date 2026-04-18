#!/bin/bash

EXPECTED_ROOM=5
EXPECTED_HASH="ee23038e084230372e643efcdded9964f73a65115e5df942394dde7f49de864c"

# 🚪 Level Lock — must be at the correct room
CURRENT=$(cat ../../.progress 2>/dev/null)
if [ "$CURRENT" != "$EXPECTED_ROOM" ]; then
    echo "🔒 Room 5 is locked! You are on room $CURRENT."
    exit 1
fi

# ❌ Flag Validation — must enter correct flag
read -p "🚩 Enter flag: " INPUT
INPUT_HASH=$(echo -n "$INPUT" | sha256sum | cut -d' ' -f1)

if [ "$INPUT_HASH" == "$EXPECTED_HASH" ]; then
    echo "✅ Correct! Room 5 cleared!"
    NEXT=$(( CURRENT + 1 ))
    echo $NEXT > ../../.progress
    echo "🚪 Room $(( EXPECTED_ROOM + 1 )) unlocked! Run: cd ../.. && ./start.sh"
else
    echo "❌ Wrong flag. Keep exploring!"
    exit 1
fi
