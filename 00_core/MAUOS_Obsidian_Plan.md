# MAUOS — как внедрить в мой Obsidian (памятка)

**Цель:** у тебя есть *Vault (данные)* и *MAUOS repo (оркестр/шаблоны)*.  
Данные живут в файлах (Markdown + assets). Агенты/инструменты — сверху.

---

## 0) Что уже сделано

- Vault в Dropbox: `~/Dropbox/Obsidian_Vault`
- `.cursorignore` — не индексировать тяжёлое/мусор
- `.cursorrules` — канон именования + поведение агента

---

## 1) Нужно ли переделывать весь Obsidian?

**Нет.**  
Делаем **минимальный MAUOS‑слой** рядом со старым, без ломки:

1) Создаём MAUOS‑папки.
2) Делаем 4 индекса.
3) Заводим 3–5 шаблонов.
4) Старое переносим только если нужно (активные проекты / демо / исследования).

---

## 2) План внедрения (по порядку)

### Шаг 1 — Создай MAUOS‑скелет папок внутри Vault
Внутри `Obsidian_Vault` создай папку: `MAUOS/`

Внутри неё:
- `MAUOS/00_core/` (правила, канон, “как тут жить”)
- `MAUOS/10_projects/`
- `MAUOS/20_research/`
- `MAUOS/30_studio/` (text/images/audio)
- `MAUOS/40_ops/` (GTD, reviews, планы)
- `MAUOS/90_context/` (identity/style/entities)
- `MAUOS/99_indexes/` (индексы)

**Зачем:** одна “OS‑ветка”, которая переживёт любые проекты.

---

### Шаг 2 — Положи канон в MAUOS/00_core
Создай (минимум):
- `Agents.md` — как агентам работать с MAUOS
- `Naming Convention.md` — правила именования (твои скрины)
- `MAUOS in Vault.md` — что такое MAUOS в этом vault

**Зачем:** чтобы через месяц ты открыл и вспомнил правила за 30 секунд.

---

### Шаг 3 — Индексы (входные точки)
В `MAUOS/99_indexes/`:
- `INDEX_PROJECTS.md`
- `INDEX_RESEARCH.md`
- `INDEX_STUDIO.md`
- `INDEX_ENTITIES.md`

**Зачем:** индексы — “панель управления”.

---

### Шаг 4 — Шаблоны заметок (Obsidian Templates)
1) Создай: `MAUOS/_templates/`
2) Obsidian → Settings → Templates → Template folder → `MAUOS/_templates/`
3) Сделай 3 шаблона:
- `project.md`
- `research.md`
- `studio-brief.md`

**Зачем:** новые файлы рождаются быстро и одинаково.

---

### Шаг 5 — Режим работы “Obsidian + Cursor”
- Obsidian: чтение/линки/мышление
- Cursor: создание/переименование/массовая переработка + агенты по rules

**На демо:** всё вокруг выступления держи в `MAUOS/30_studio/text/` и `MAUOS/40_ops/`.

---

## 3) Минимальные шаблоны (скелеты)

### Project
**Имя:** `{project} {plan} Project Name — YYYY-MM-DD — Manual.md`
- What / Why
- Scope (in/out)
- Deliverables
- Risks
- Next actions
- Links

### Research
**Имя:** `{project} {research} Topic — YYYY-MM-DD — Manual.md`
- Question
- Hypotheses
- Sources
- Notes
- Synthesis
- Next actions

### Studio brief (text/image/audio)
**Имя:** `{project} {brief} Asset Name — YYYY-MM-DD — Manual.md`
- Goal
- Audience
- Style / references
- Constraints
- Prompts / params
- Versions
- Final exports

---

## 4) Что делать со старым контентом

**Не мигрируй всё.**  
Только активное:
- создаёшь новый файл по канону в MAUOS,
- вставляешь/суммируешь нужное,
- оставляешь ссылку на оригинал.

---

## 5) Если потерялся (быстрый чеклист)

1) Это project / research / studio / ops?
2) Я в правильной MAUOS‑папке?
3) Есть индекс, куда это ссылать?
4) Имя файла по канону: `{project} {type} ... — date — interface`
5) Новая папка → сначала `Agents.md`.

