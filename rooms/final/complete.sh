#!/bin/bash

EXPECTED_ROOM=11
EXPECTED_HASH="787317fe3b7051b6880e682ae1196f58d26ee5ed1f74b896f88a469c447e9c04"

# 🚪 Level Lock
CURRENT=$(cat ../../.progress 2>/dev/null)
if [ "$CURRENT" != "$EXPECTED_ROOM" ]; then
    echo "🔒 Final room is locked! Complete all rooms first (you are on room $CURRENT)."
    exit 1
fi

# 👑 Role Check — must be admin
if [ "$ROLE" != "admin" ]; then
    echo "🔒 Access denied. Only admin can complete this room."
    echo "💡 Hint: You have the password somewhere..."
    exit 1
fi

# ❌ Flag Validation
read -p "🚩 Enter final flag: " INPUT
INPUT_HASH=$(echo -n "$INPUT" | sha256sum | cut -d' ' -f1)

if [ "$INPUT_HASH" == "$EXPECTED_HASH" ]; then
    echo ""
    echo "🏆 =============================== 🏆"
    echo "   Congratulations, $USER!"
    echo "   You have mastered BashDungeon!"
    echo "🏆 =============================== 🏆"
    echo ""
else
    echo "❌ Wrong flag. The dungeon is not yet conquered!"
    exit 1
fi
