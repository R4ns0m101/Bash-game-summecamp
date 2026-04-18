#!/bin/bash

EXPECTED_ROOM=3
EXPECTED_HASH="495656560d1a73a0ffcd9696c02edf0d00210e1b6a21e4d6c7d5a27be4c9ea18"

# 🚪 Level Lock — must be at the correct room
CURRENT=$(cat ../../.progress 2>/dev/null)
if [ "$CURRENT" != "$EXPECTED_ROOM" ]; then
    echo "🔒 Room 3 is locked! You are on room $CURRENT."
    exit 1
fi

# ❌ Flag Validation — must enter correct flag
read -p "🚩 Enter flag: " INPUT
INPUT_HASH=$(echo -n "$INPUT" | sha256sum | cut -d' ' -f1)

if [ "$INPUT_HASH" == "$EXPECTED_HASH" ]; then
    echo "✅ Correct! Room 3 cleared!"
    NEXT=$(( CURRENT + 1 ))
    echo $NEXT > ../../.progress
    echo "🚪 Room $(( EXPECTED_ROOM + 1 )) unlocked! Run: cd ../.. && ./start.sh"
else
    echo "❌ Wrong flag. Keep exploring!"
    exit 1
fi
