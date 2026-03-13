# Bash scripts

Lightweight scripts for health checks and rollout/deployment templates. Use on Linux, macOS, or WSL.

| Script | Use when |
|--------|----------|
| **health_check.sh** | You need to verify an HTTP endpoint (internal portal, API, or app) returns 200. |
| **deploy_stub.sh** | You want a starting point for a deployment or rollout script (edit the commented steps). |

**Usage:**  
`./health_check.sh [URL]` — defaults to `http://localhost:8080/health` if no URL given.  
`./deploy_stub.sh` — run as-is or copy and adapt for your app.

Requires `curl` for the health check.
