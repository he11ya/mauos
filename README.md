# MAUOS

**MAUOS (Multi‑Agent Universal Operating System)** — file‑first система для проектов, исследований и оркестра нейросетей (текст · графика · музыка).  
Данные живут в файлах (Markdown + assets). Агенты и инструменты — сверху, как исполняемый слой.

> **Статус:** Alpha — в активной разработке.

---

## Зачем

- **Одна архитектура** для личных и бизнес‑проектов, исследований и продакшна контента.
- **Воспроизводимость**: у каждого результата есть бриф → промпты/настройки → версии → финал.
- **Мультимодальность**: текст/изображения/аудио одинаково становятся артефактами, которые можно хранить, сравнивать, переиспользовать.
- **Прозрачность**: видно, что делалось, почему и чем.

---

## Архитектура

```text
MAUOS
├── CORE (principles + conventions)
│   ├── naming / tags / file-types
│   └── templates / security split
│
├── SKILLS (workflows)
│   ├── Capture → Inbox → Triage
│   ├── Research → Sensemaking → Synthesis
│   ├── Build → Ship → Publish
│   └── Review → Retro → Improve
│
├── AGENTS (roles)
│   ├── Research: scout, analyst, fact-checker
│   ├── Studio: writer, editor, designer, music-producer
│   ├── Ops: PM, GTD-keeper, archivist
│   └── Synthesizer: assembler / storyteller
│
├── MCP PORTS (tools)
│   ├── Web / Search / PDF
│   ├── Telegram / Gmail / Calendar
│   ├── Image models (gen + edit)
│   └── Audio models (music/voice)
│
└── CONTEXT (identity + style + entities)
    ├── Voice & rules (how to write/think)
    ├── Projects (active intents)
    └── Entities (people/orgs/terms)
```

---

## Принципы

- **File‑first**: состояние хранится на диске, а не в чате.
- **Vault‑based**: данные отделены от кода (можно переносить/синкать/бэкапить).
- **Private/Shared split**: личное локально, командное — через Git/Sync.
- **Agent‑ready**: структура понятна людям и агентам.
- **Reproducible**: каждый артефакт “собирается” из входов и фиксирует контекст.

---

## Структура хранилища (Vault)

> Это про **данные** (Obsidian‑vault). Репозиторий MAUOS — про **код/доки/шаблоны**.

```text
~/MAUOSVault/
├── private/                      # личное (не коммитим)
│   ├── context/                  # identity, style, preferences
│   ├── inbox/                    # входящее: ссылки/заметки/голос/фото
│   ├── projects/                 # личные проекты
│   ├── research/                 # исследования
│   ├── studio/
│   │   ├── text/                 # посты/скрипты/лекции
│   │   ├── images/               # брифы, промпты, рендеры, версии
│   │   └── audio/                # музыка/голос, проектники, рендеры
│   └── ops/                      # GTD, briefs, reviews
│
├── shared/                       # командное (git/sync)
│   ├── projects/
│   ├── research/
│   ├── studio/
│   └── context/calls/            # общие транскрипты/встречи
│
└── indexes/                      # «оглавления» и входы
    ├── INDEX_PROJECTS.md
    ├── INDEX_RESEARCH.md
    ├── INDEX_STUDIO.md
    └── INDEX_ENTITIES.md
```

---

## Структура репозитория (code + docs)

```text
mauos/
├── agents/                       # профили ролей и правила взаимодействия
├── skills/                       # описания workflows + чеклисты
├── mcp/                          # конфиги портов/серверов
├── templates/                    # шаблоны файлов (project/research/studio)
├── scripts/                      # утилиты: reindex, export, publish
├── docs/                         # гайды и примеры
└── README.md
```

---

## Quick Start

1) Создай Vault `MAUOSVault/` и базовые папки (см. дерево выше).  
2) Добавь индексы в `indexes/` и шаблоны в `templates/`.  
3) Подключи порты (MCP) по необходимости: web/research, telegram, gmail/calendar, image, audio.  
4) Начни с 3 потоков:

- **Capture → Inbox → Triage** (каждый день)
- **Research → Synthesis** (по запросу)
- **Build → Ship → Publish** (под релизы и контент)

---

## Workflows (коротко)

### Research
- собрать карту темы
- достать источники и цитаты
- сделать синтез: тезисы / риски / вопросы / next steps

### Studio (text / image / audio)
- бриф
- прототип (черновик/эскиз/демо)
- версии (A/B)
- финал + упаковка + публикация
- сохранение промптов и параметров рядом

### Ops
- weekly review
- календарь/планирование
- “архив как продукт” (чтобы через 3 месяца всё было понятно)

---

## Roadmap (draft)

- [ ] Минимальные шаблоны: `project`, `research`, `studio-text`, `studio-image`, `studio-audio`
- [ ] Индекс типов файлов (transcripts/messages/articles/assets)
- [ ] Стандарт метаданных (frontmatter)
- [ ] Скрипты: reindex / export / publish
- [ ] Подключение портов: web + telegram + mail/calendar + image + audio

---

## Inspiration

Inspired by: 
**AI Mindset** by Alex Povalyaev: [aimindset](https://aimindset.org/)
**CYBOS** by Gerstep: [CybOS](https://github.com/Gerstep/cybos)

---

## License

MIT License with Attribution Requirement

Copyright (c) 2026 Mauos Contributors
