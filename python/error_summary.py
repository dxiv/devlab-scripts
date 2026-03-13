"""
Count ERROR, WARN, and INFO lines in a log file for fast triage.
"""

import sys
from pathlib import Path
from collections import Counter


def summarise(log_path: str) -> None:
    path = Path(log_path)

    if not path.exists():
        print(f"[!] Log file not found: {path}")
        return

    counts = Counter()

    with path.open() as f:
        for line in f:
            if "ERROR" in line:
                counts["ERROR"] += 1
            elif "WARN" in line:
                counts["WARN"] += 1
            elif "INFO" in line:
                counts["INFO"] += 1

    print(f"Summary for {path}:")
    for level in ["ERROR", "WARN", "INFO"]:
        print(f"  {level}: {counts[level]}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python error_summary.py <path-to-log>")
    else:
        summarise(sys.argv[1])