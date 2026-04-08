#!/bin/bash
# buddy.1m.sh — тамагочи в статус-баре, обновляется каждую минуту

STATE_FILE="$HOME/.buddy_state"
LIMITS_FILE="$HOME/.buddy_limits"
MAUOS_DIR="$HOME/Dropbox/Obsidian_Vault/MAUOS"

# --- Инициализация состояния ---
if [ ! -f "$STATE_FILE" ]; then
  echo "START=$(date +%s)" > "$STATE_FILE"
  echo "ENERGY=0" >> "$STATE_FILE"
fi

source "$STATE_FILE"

# --- Лимиты Claude (обновляй вручную в ~/.buddy_limits) ---
SESSION_USED=0
SESSION_RESET="?"
WEEKLY_USED=0
WEEKLY_RESET="?"
[ -f "$LIMITS_FILE" ] && source "$LIMITS_FILE"

# --- Считаем минуты с последнего сброса ---
NOW=$(date +%s)
ELAPSED=$(( (NOW - START) / 60 ))

# --- Определяем состояние тамагочи ---
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

# --- Цвет для сессионного лимита ---
if [ "$SESSION_USED" -lt 50 ]; then
  SESSION_COLOR="🟢"
elif [ "$SESSION_USED" -lt 80 ]; then
  SESSION_COLOR="🟡"
else
  SESSION_COLOR="🔴"
fi

# --- Цвет для недельного лимита ---
if [ "$WEEKLY_USED" -lt 50 ]; then
  WEEKLY_COLOR="🟢"
elif [ "$WEEKLY_USED" -lt 80 ]; then
  WEEKLY_COLOR="🟡"
else
  WEEKLY_COLOR="🔴"
fi

# --- Статус Git ---
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

# --- Строка в статус-баре ---
echo "${FACE} ${ELAPSED}m"

# --- Выпадающее меню ---
echo "---"
echo "Состояние: ${STATUS}"
echo "Работаю: ${ELAPSED} минут"
echo "---"
echo "Claude Pro — лимиты"
echo "Сессия:  ${SESSION_COLOR} ${SESSION_USED}%/100% · сброс через ${SESSION_RESET}"
echo "Неделя:  ${WEEKLY_COLOR} ${WEEKLY_USED}%/100% · сброс ${WEEKLY_RESET}"
echo "✏️ Обновить лимиты | bash='open ~/.buddy_limits' terminal=false"
echo "---"
echo "✅ Сделал перерыв (сброс таймера) | bash='echo START=$(date +%s) > $STATE_FILE && echo ENERGY=0 >> $STATE_FILE' terminal=false refresh=true"
echo "☕ Выпил чай (+10 мин энергии) | bash='echo START=$(( $(date +%s) - 600 )) > $STATE_FILE' terminal=false refresh=true"
echo "⚡ Второе дыхание (сброс в 0) | bash='echo START=$(date +%s) > $STATE_FILE && echo ENERGY=1 >> $STATE_FILE' terminal=false refresh=true"
echo "---"
echo "📊 Git: ${GIT_STATUS}"
echo "📤 Git push | bash='cd $MAUOS_DIR && git add . && git commit -m \"auto backup\" && git push' terminal=true"
echo "---"
echo "🔄 Обновить | refresh=true"
