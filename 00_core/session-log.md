# MAUOS Setup — Session Log

## Session 001 — 2026-04-08/09
**Тема:** iTerm2 + Claude Code + SwiftBar + GitHub

---

### Сделано

#### Терминал (zsh / iTerm2)
- Переход с bash на zsh
- Чистый `~/.zshrc` с комментариями на каждую строку
- API-ключ вынесен в `~/.zshrc.secrets` (chmod 600)
- Алиасы: `ll`, `la`, `c`, `gs`, `..`, `...`
- История команд: 10000 строк, поиск стрелками ↑↓
- Автодополнение с меню (zsh-autocomplete)
- Серые подсказки из истории (zsh-autosuggestions)

#### Zo API
- Команды `zo "вопрос"`, `zofile file.md`, `zopipe` работают
- Модель: `vercel:minimax/minimax-m2.7`
- Ключ в `~/.zshrc.secrets`

#### Claude Code
- Установлен, работает
- `CLAUDE.md` в `~/Dropbox/Obsidian_Vault/MAUOS/`
- Персонаж Милашка — мудрый энергичный кот, русский язык
- Статус после каждого ответа: `ctx: XK | XK | 🟢/🟡/🔴 X%/100%`
- `eval: T:[✓] R:[✓] C:[✓]`

#### GitHub
- SSH ключ создан (`~/.ssh/id_ed25519`), добавлен на github.com
- Passphrase убран
- Remote: `git@github.com:he11ya/mauos.git`
- MAUOS vault запушен

#### SwiftBar (тамагочи)
- Установлен в `/Applications/SwiftBar.app`
- Плагин: `~/Dropbox/Obsidian_Vault/MAUOS/40_ops/swiftbar/buddy.1m.sh`
- Состояния по времени:
  - 0-30 мин: 🔭 много энергии
  - 30-60 мин: 🔬 ещё думаю
  - 60-80 мин: 💆 нужен перерыв
  - 80-90 мин: 🌊 перегрузка
  - 90+ мин: 🎩 пора чай
- Состояние хранится в `~/.buddy_state`

#### Buddy (/buddy)
- Personality переведён на русский через `~/.claude.json`
- `any-buddy` установлен — ждём фикса под v2.1.97
- `/buddy` сломан в v2.1.97 (баг Anthropic)

---

### TODO — следующая сессия

| # | Задача | Приоритет |
|---|--------|-----------|
| 1 | Починить кнопки SwiftBar (сброс таймера + git push из меню не работают) | 🔴 высокий |
| 2 | Безопасный автобэкап (crontab убран — был опасным) | 🔴 высокий |
| 3 | Кастомные карточки buddy как у @apowall | 🟡 средний |
| 4 | Арт Милашки — уши уезжают на 2 пробела | 🟢 низкий |
| 5 | Дождаться обновления any-buddy под v2.1.97 | ⏳ ждём |

---

### Команды для старта новой сессии

```bash
# Запуск Claude Code в MAUOS
cd ~/Dropbox/Obsidian_Vault/MAUOS && claude

# Проверить версию Claude Code (ждём > 2.1.97)
claude --version

# Проверить any-buddy после обновления
npx any-buddy@latest

# Статус git
cd ~/Dropbox/Obsidian_Vault/MAUOS && git status
```

---

### Структура файлов

```
~/.zshrc                          — основной конфиг терминала
~/.zshrc.secrets                  — API ключи (chmod 600)
~/.buddy_state                    — состояние тамагочи
~/.claude.json                    — конфиг Claude Code + buddy personality
~/.ssh/id_ed25519                 — SSH ключ для GitHub
~/Dropbox/Obsidian_Vault/MAUOS/
  CLAUDE.md                       — инструкции для Claude Code (Милашка)
  40_ops/swiftbar/buddy.1m.sh     — плагин тамагочи для SwiftBar
  00_core/session-log.md          — этот файл
```

---

### Версии на момент сессии

| Инструмент | Версия |
|------------|--------|
| Claude Code | 2.1.97 |
| macOS | 13.7 (Ventura) |
| zsh | system |
| Homebrew | 5.1.1 |
| Node.js | v24.x |
| any-buddy | 2.2.0 |
| SwiftBar | 2.0.1 |
