cat > scaffold.sh << 'EOF'
#!/usr/bin/env bash
# Scaffold OMKey repo at /home/mikehunt/OMKey

BASE_DIR="/home/mikehunt/OMKey"
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit 1

# 1. .gitignore
cat > .gitignore << 'GITIGNORE'
__pycache__/
*.py[cod]
.venv/
*.log
atr_log.csv
GITIGNORE

# 2. README.md
cat > README.md << 'EOF'
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
git clone https://github.com/Art512-coder/OMKey.git
cd OMKey
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python3 scripts/atr_logger.py
