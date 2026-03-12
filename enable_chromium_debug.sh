#!/bin/bash
# Helper script to enable Chromium remote debugging
# Run this, then use: python3 chatgpt_bridge.py --mode cdp "your message"

echo "Checking for running Chromium..."
if pgrep -f chromium > /dev/null; then
    echo "Chromium is running. You'll need to:"
    echo "1. Close the current Chromium window"
    echo "2. Restart it with: chromium --remote-debugging-port=9222 https://chatgpt.com"
    echo ""
    echo "Or if you want to keep the current session, try:"
    echo "chromium --remote-debugging-port=9222 --new-window https://chatgpt.com"
else
    echo "Starting Chromium with remote debugging..."
    chromium --remote-debugging-port=9222 https://chatgpt.com &
    echo "Chromium started. Wait a few seconds for it to load, then run:"
    echo "python3 chatgpt_bridge.py --mode cdp 'your message'"
fi
