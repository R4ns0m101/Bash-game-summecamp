#!/bin/bash
if [ -f "flag.txt" ]; then
    echo "🎉 Correct! You renamed the file successfully."
    echo "Your flag:"
    echo "U01De3JlbmFtZV9wb3dlcn0=" | base64 -d
    echo ""
else
    echo "❌ No file named 'flag.txt' found here."
    echo "💡 Maybe something needs a new name..."
fi
