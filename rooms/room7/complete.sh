#!/bin/bash

EXPECTED_ROOM=7
EXPECTED_HASH="565987da28319a05cee7198dd35472e3178a49ffd63f7c61191ee6063c3a1079"

# 🚪 Level Lock — must be at the correct room
CURRENT=$(cat ../../.progress 2>/dev/null)
if [ "$CURRENT" != "$EXPECTED_ROOM" ]; then
    echo "🔒 Room 7 is locked! You are on room $CURRENT."
    exit 1
fi

# ❌ Flag Validation — must enter correct flag
read -p "🚩 Enter flag: " INPUT
INPUT_HASH=$(echo -n "$INPUT" | sha256sum | cut -d' ' -f1)

if [ "$INPUT_HASH" == "$EXPECTED_HASH" ]; then
    echo "✅ Correct! Room 7 cleared!"
    NEXT=$(( CURRENT + 1 ))
    echo $NEXT > ../../.progress
    echo "🚪 Room $(( EXPECTED_ROOM + 1 )) unlocked! Run: cd ../.. && ./start.sh"
else
    echo "❌ Wrong flag. Keep exploring!"
    exit 1
fi
