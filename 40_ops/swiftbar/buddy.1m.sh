#!/bin/bash
# buddy.1m.sh — пример для SwiftBar (обновление раз в минуту).
# Задай каталог клона MAUOS, например: export MAUOS_DIR="$HOME/path/to/mauos"
# По умолчанию: ~/MAUOS (измени под себя локально; не коммить секреты).

STATE_FILE="${BUDDY_STATE_FILE:-$HOME/.buddy_state}"
MAUOS_DIR="${MAUOS_DIR:-$HOME/MAUOS}"

# --- Инициализация состояния ---
if [ ! -f "$STATE_FILE" ]; then
  echo "START=$(date +%s)" > "$STATE_FILE"
  echo "ENERGY=0" >> "$STATE_FILE"
  echo "SESSION_USED=0" >> "$STATE_FILE"
  echo "WEEKLY_USED=0" >> "$STATE_FILE"
fi

# shellcheck source=/dev/null
source "$STATE_FILE"

SESSION_USED="${SESSION_USED:-0}"
WEEKLY_USED="${WEEKLY_USED:-0}"

# --- Считаем минуты с последнего сброса ---
NOW=$(date +%s)
ELAPSED=$(( (NOW - START) / 60 ))

# --- Состояние «тамагочи» ---
if [ "$ELAPSED" -lt 30 ]; then
  FACE="🔭"
  STATUS="много энергии"
elif [ "$ELAPSED" -lt 60 ]; then
  FACE="🔬"
  STATUS="ещё думаю"
elif [ "$ELAPSED" -lt 80 ]; then
  FACE="💆"
  STATUS="нужен перерыв"
elif [ "$ELAPSED" -lt 90 ]; then
  FACE="🌊"
  STATUS="перегрузка"
else
  FACE="🎩"
  STATUS="пора чай"
fi

# --- Статус Git (если MAUOS_DIR — git-репозиторий) ---
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

echo "${FACE} ${ELAPSED}m"
echo "---"
echo "Состояние: ${STATUS}"
echo "Работаю: ${ELAPSED} минут"
echo "---"
echo "✅ Сделал перерыв (сброс таймера) | bash='echo START=$(date +%s) > $STATE_FILE && echo ENERGY=0 >> $STATE_FILE' terminal=false refresh=true"
echo "☕ Выпил чай (+10 мин энергии) | bash='echo START=$(( $(date +%s) - 600 )) > $STATE_FILE' terminal=false refresh=true"
echo "⚡ Второе дыхание (сброс в 0) | bash='echo START=$(date +%s) > $STATE_FILE && echo ENERGY=1 >> $STATE_FILE' terminal=false refresh=true"
echo "---"
echo "📊 Git: ${GIT_STATUS} (MAUOS_DIR=$MAUOS_DIR)"
# Не запускаем слепой commit/push из меню — слишком рискованно для шаблона.
echo "📤 Git: делай push вручную после review | terminal=false"
echo "---"
echo "🔄 Обновить | refresh=true"
