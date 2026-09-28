#!/usr/bin/env python3
"""Expose one day's Org agenda to Eww as JSON.

The Org/Emacs behavior lives in the repository's pill bridge. This adapter only
chooses the date, invokes the bridge, and guarantees valid JSON for Eww.
"""
from __future__ import annotations

import json
import os
import subprocess
import sys
from datetime import date
from pathlib import Path


BRIDGE = Path(
    os.environ.get(
        "PILL_ORGBRIDGE",
        "~/programming/mpourismaiel-dotfiles/quickshell/pill/orgbridge.py",
    )
).expanduser()


def main() -> None:
    day = sys.argv[1] if len(sys.argv) > 1 else date.today().isoformat()
    command = [sys.executable, str(BRIDGE)]

    agenda_dir = os.environ.get("ORG_AGENDA_DIR", "")
    if agenda_dir:
        command.extend(["--dir", os.path.expanduser(agenda_dir)])
    command.extend(["day", day])

    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=15,
            check=False,
        )
        payload = json.loads(result.stdout or "[]")
        if not isinstance(payload, list):
            payload = []
    except (OSError, subprocess.SubprocessError, json.JSONDecodeError):
        payload = []

    print(json.dumps(payload, ensure_ascii=False))


if __name__ == "__main__":
    main()
