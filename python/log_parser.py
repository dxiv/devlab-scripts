"""
Extract ERROR lines from a log file. Useful for quick triage of application or system logs.
"""

import sys
from pathlib import Path


def extract_errors(log_path: str) -> None:
    path = Path(log_path)

    if not path.exists():
        print(f"[!] Log file not found: {path}")
        return

    print(f"[+] Reading: {path}")
    with path.open() as f:
        for line in f:
            if "ERROR" in line:
                print(line.rstrip())


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python log_parser.py <path-to-log>")
    else:
        extract_errors(sys.argv[1])