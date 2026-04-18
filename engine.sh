#!/bin/bash

PROGRESS_FILE=".progress"

CURRENT=$(cat $PROGRESS_FILE)

if [ "$CURRENT" -le 10 ]; then
ROOM="rooms/room$CURRENT"
else
ROOM="rooms/final"
fi

cd $ROOM

echo ""
echo "🗝 Entering Room $CURRENT"
echo "--------------------------------"
echo "Hint: read everything carefully"
echo "--------------------------------"

bash
