#!/bin/bash

if [ "$ROLE" != "admin" ]; then
echo "Access denied"
exit 1
fi

echo "Final challenge unlocked"
