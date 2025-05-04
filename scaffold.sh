````bash
#!/usr/bin/env bash
# Scaffold script for OMKey repository
# Usage: Save this as scaffold.sh and run: bash scaffold.sh

BASE_DIR="/home/mikehunt/OMKey"

# Ensure the base directory exists and change into it
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || { echo "Failed to cd to $BASE_DIR"; exit 1; }

echo "Working in $BASE_DIR"

# 1. Create .gitignore
cat > .gitignore << 'GITIGNORE'
__pycache__/
*.py[cod]
.venv/
*.log
atr_log.csv
GITIGNORE

echo ".gitignore created."

# 2. Create README.md
cat > README.md << 'READMEEOF'
# OMKey

ATR‑fingerprinting & smart‑card red/blue toolkit for Kali (OmniKey 3x21)

## Overview
This repository provides tools to:
- Passively log ATRs from smart cards
- Parse and cluster ATRs for issuer identification
- Probe EMV/PIV applets via APDUs
- Analyze retry counters and timing for PIN attacks

## Quickstart
```bash
# Clone and enter repo
git clone https://github.com/Art512-coder/OMKey.git
cd OMKey

# Create and activate a Python venv
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run ATR logger
default: logs to atr_log.csv
python3 scripts/atr_logger.py
````

## File Structure

```
OMKey/
├── .gitignore
├── README.md
├── requirements.txt
├── PyScard.py           # existing script if present
├── scaffold.sh         # this script
└── scripts/
    ├── atr_logger.py   # ATR capture daemon
    └── apdu_probe.py   # stub for APDU probing
```

READMEEOF

echo "README.md created."

# 3. Create requirements.txt

cat > requirements.txt << 'REQEOF'
pyscard
pandas
click
REQEOF

echo "requirements.txt created."

# 4. Create scripts directory

mkdir -p scripts

echo "scripts/ directory created."

# 5. Create scripts/atr\_logger.py

cat > scripts/atr\_logger.py << 'LOGEOF'
\#!/usr/bin/env python3
"""
atr\_logger.py
Continuously logs ATRs from OmniKey reader to a CSV file for later analysis.
"""
import csv
from smartcard.CardMonitoring import CardMonitor, CardObserver
from smartcard.util import toHexString

OUTPUT = 'atr\_log.csv'

class ATRLogger(CardObserver):
def update(self, observable, actions):
added, removed = actions
with open(OUTPUT, 'a', newline='') as csvfile:
writer = csv.writer(csvfile)
for card in added:
atr = toHexString(card.atr)
print(f"\[+] ATR: {atr}")
writer.writerow(\[atr])

def main():
\# initialize CSV with header
with open(OUTPUT, 'w', newline='') as csvfile:
writer = csv.writer(csvfile)
writer.writerow(\['ATR'])
monitor = CardMonitor()
monitor.addObserver(ATRLogger())
print(f"\[\*] Logging ATRs to {OUTPUT}. Press Ctrl-C to exit.")
try:
while True:
pass
except KeyboardInterrupt:
print("\nExiting.")

if **name** == '**main**':
main()
LOGEOF

chmod +x scripts/atr\_logger.py

echo "scripts/atr\_logger.py created and made executable."

# 6. Create scripts/apdu\_probe.py

cat > scripts/apdu\_probe.py << 'PROBEOF'
\#!/usr/bin/env python3
"""
apdu\_probe.py
Send SELECT and READ RECORD APDUs to a smart card for fingerprinting.
"""
import sys
from smartcard.System import readers

# TODO: implement probe functions

def main():
print("APDU probe functionality coming soon.")

if **name** == '**main**':
main()
PROBEOF

chmod +x scripts/apdu\_probe.py

echo "scripts/apdu\_probe.py created and made executable."

echo "Scaffold complete under \$BASE\_DIR. Run 'ls -R \$BASE\_DIR' to verify file structure."\`\`\`
