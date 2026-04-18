#!/bin/bash

EXPECTED_ROOM=9
EXPECTED_HASH="796c13cced40a7416a7e6a12ef93ffd2fb3a9ee9a692b47f291dc4cbb1478d7d"

# 🚪 Level Lock — must be at the correct room
CURRENT=$(cat ../../.progress 2>/dev/null)
if [ "$CURRENT" != "$EXPECTED_ROOM" ]; then
    echo "🔒 Room 9 is locked! You are on room $CURRENT."
    exit 1
fi

# ❌ Flag Validation — must enter correct flag
read -p "🚩 Enter flag: " INPUT
INPUT_HASH=$(echo -n "$INPUT" | sha256sum | cut -d' ' -f1)

if [ "$INPUT_HASH" == "$EXPECTED_HASH" ]; then
    echo "✅ Correct! Room 9 cleared!"
    NEXT=$(( CURRENT + 1 ))
    echo $NEXT > ../../.progress
    echo "🚪 Room $(( EXPECTED_ROOM + 1 )) unlocked! Run: cd ../.. && ./start.sh"
else
    echo "❌ Wrong flag. Keep exploring!"
    exit 1
fi
