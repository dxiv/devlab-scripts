# Python scripts

Cross-platform log triage for tickets, reports, or ad-hoc analysis. No extra packages—stdlib only.

| Script | Use when |
|--------|----------|
| **log_parser.py** | You need every ERROR line from a log (e.g. paste into a ticket or grep substitute). |
| **error_summary.py** | You need a quick count of ERROR / WARN / INFO (e.g. “how bad is this log?”). |

**Usage:**  
`python log_parser.py <path-to-log>`  
`python error_summary.py <path-to-log>`

Works with any text log; looks for the words ERROR, WARN, INFO in each line.
