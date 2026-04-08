#!/bin/bash
# buddy.1m.sh — обновляется каждую минуту

# Загружаем секреты
source ~/.zshrc.secrets 2>/dev/null

# --- Статус Git ---
MAUOS_DIR="$HOME/Dropbox/Obsidian_Vault/MAUOS"
if cd "$MAUOS_DIR" 2>/dev/null; then
  UNCOMMITTED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  if [ "$UNCOMMITTED" -eq 0 ]; then
    GIT_STATUS="git ✓"
  else
    GIT_STATUS="git ~${UNCOMMITTED}"
  fi
else
  GIT_STATUS="git ?"
fi

# --- Статус Obsidian ---
if pgrep -x "Obsidian" > /dev/null; then
  OBS_STATUS="obs ✓"
else
  OBS_STATUS="obs ○"
fi

# --- Статус GitHub ---
if ssh -q -o BatchMode=yes -o ConnectTimeout=3 git@github.com 2>&1 | grep -q "successfully authenticated"; then
  GH_STATUS="gh ✓"
else
  GH_STATUS="gh ○"
fi

# --- Строка в статус-баре ---
echo "🤖 ${GIT_STATUS} | ${OBS_STATUS} | ${GH_STATUS}"
echo "---"
echo "MAUOS: $MAUOS_DIR"
echo "Открыть vault | bash='open $MAUOS_DIR' terminal=false"
echo "Git push | bash='cd $MAUOS_DIR && git add . && git commit -m \"auto\" && git push' terminal=true"
echo "---"
echo "Обновить | refresh=true"
