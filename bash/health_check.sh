#!/bin/bash
# Simple HTTP health check script.

URL="${1:-http://localhost:8080/health}"

echo "[+] Checking health for: $URL"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" -eq 200 ]; then
  echo "[+] Service healthy (HTTP $STATUS)"
else
  echo "[!] Service may be unhealthy (HTTP $STATUS)"
fi
