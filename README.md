# Desktop & EUC Scripts

A collection of **ready-to-use scripts** for **desktop technicians**, **end user computing (EUC) engineers**, and **systems analysts**—log triage, health checks, disk and temp cleanup, and simple automation you can drop into your day job.

No frameworks or installs beyond what you already have: Python, Bash, and PowerShell. Copy what you need and adapt to your environment.

---

## Who this is for

- **Desktop support / technicians** — Quick log checks, temp cleanup, disk space, and basic diagnostics on Windows or shared tools.
- **EUC engineers** — Scripts to reuse in packaging, rollout, or support workflows; health checks for internal services.
- **Systems analysts** — Log parsing and summarisation for incident triage, reporting, or ad‑hoc analysis.

---

## Script index

| Script | Where | What it does |
|--------|--------|----------------|
| **log_parser.py** | `python/` | Extract all ERROR lines from a log file (quick triage). |
| **error_summary.py** | `python/` | Count ERROR / WARN / INFO lines in a log (summary for tickets or reports). |
| **tools.ps1** | `powershell/` | `Get-RecentErrors`, `Clean-TempFolder`, `Get-DiskSpaceSummary`, `Get-QuickSystemInfo` for Windows. |
| **health_check.sh** | `bash/` | HTTP health check for a URL (e.g. internal portals, APIs). |
| **deploy_stub.sh** | `bash/` | Template for rollout or deployment steps (customise per app). |
| **Unity Client scripts** | `unity-scripts/` | Placeholder for Hyland EDMS OnBase (Unity Client) scripts—installs, config, troubleshooting. |

---

## Quick start

**PowerShell (Windows — log scan, temp cleanup, disk space, quick info):**
```powershell
. .\powershell\tools.ps1
Get-RecentErrors -LogPath "C:\ProgramData\MyApp\logs\app.log"
Clean-TempFolder -Path "C:\Users\jdoe\AppData\Local\Temp\MyApp"
Get-DiskSpaceSummary
Get-QuickSystemInfo
```

**Python (log triage — any platform):**
```bash
# Just the ERROR lines
python python/log_parser.py "C:\logs\app.log"

# Count by level (ERROR / WARN / INFO)
python python/error_summary.py /var/log/app.log
```

**Bash (health check):**
```bash
./bash/health_check.sh https://intranet.company.com/status
```

---

## Project structure

```
├── python/           Log parsing and summary (cross‑platform)
├── powershell/       Windows: logs, temp, disk, system info
├── bash/             Health checks, deployment/rollout template
├── unity-scripts/    Hyland EDMS OnBase (Unity Client) scripts (contributions welcome)
└── docs/             Extra notes, runbooks, references
```

---

## Requirements

- **PowerShell:** Windows PowerShell 5.1 or PowerShell Core (Windows/Linux/macOS).
- **Python:** 3.7+ (stdlib only).
- **Bash:** Any POSIX shell with `curl` (for health_check.sh).

---

## Contributing

Scripts that are useful for desktop, EUC, or systems analysis work are welcome—log handling, diagnostics, cleanup, deployment helpers, or small automation. **Hyland EDMS OnBase (Unity Client)** scripts (installs, config, troubleshooting) are especially welcome in `unity-scripts/`. Open an issue to suggest an idea or send a pull request.

---

## License

MIT — see [LICENSE](LICENSE). Use and adapt in your job; no warranty.
