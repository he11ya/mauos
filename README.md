MAUOS

Multi-Agent Universal Operating System — file-first операционная система для личных и командных проектов, исследований и управления оркестром нейросетей (текст, графика, музыка).
Всё состояние — в Markdown/файлах. Агенты и MCP-инструменты — поверх, как “исполнители” и “порты”.

Quick Start

Создай “Vault” (Obsidian-хранилище) для MAUOS

Подключи MCP-серверы (по желанию: web/research, telegram, gmail/calendar, image, audio)

Запусти базовые workflows: capture → triage → research → produce → publish → archive

Цель: одна архитектура, куда ты можешь “вкладывать” любые проекты (личные/бизнес), исследования и продакшн-потоки контента.

Commands (примерная идея)
Research

/mau-research-topic "X" — собрать карту темы + источники + конспект

/mau-research-market "Y" — рынок/игроки/тренды/риски

/mau-research-company "Z" — due diligence / профайл

Content (text/image/audio)

/mau-draft "тема" — черновик поста/эссе/скрипта

/mau-image "концепт" — бриф + генерация (и сохранение промпта/версий)

/mau-audio "концепт" — музыка/саунд-дизайн (бриф + версии)

Ops / PKM

/mau-inbox — разобрать входящее (заметки/ссылки/сообщения)

/mau-brief — утренний бриф (сегодня/риски/фокус/контекст)

/mau-reindex — пересобрать индекс сущностей/проектов

(Это не обязательно именно “slash commands”, но такой интерфейс удобно документировать — как в CYBOS.)

Architecture
MAUOS
├── CORE (principles + conventions)
│   ├── Naming, Tags, Index Types, Templates
│   └── Security: private/shared split
│
├── SKILLS (workflows)
│   ├── Capture / Inbox / Triage
│   ├── Research / Sensemaking / Synthesis
│   ├── Build / Ship / Publish
│   └── Review / Retro / Improve
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
    ├── You (voice, tone, principles)
    ├── Projects (active intents)
    └── Knowledge graph (people/orgs/terms)


Design principles (как “конституция”):

File-first: состояние живёт на диске (md, assets), а не в “чате”

Vault-based: данные отдельно от кода (хранилище можно переносить/синкать)

Private/Shared split: личное локально, командное — через Git/Sync

Multi-modal orchestration: текст/картинки/музыка одинаково “файловые артефакты”

Reproducibility: у каждого результата есть: бриф → промпты/настройки → версии → финал

File Structure (Vault)
~/MAUOSVault/
├── private/                      # личное (не синкаем)
│   ├── context/                  # identity, style, keys refs (без секретов в git)
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
└── indexes/                      # “оглавления” и типовые входы
    ├── INDEX_PROJECTS.md
    ├── INDEX_RESEARCH.md
    ├── INDEX_STUDIO.md
    └── INDEX_ENTITIES.md

Repo Structure (code + docs)
mauos/
├── .claude/ or .agents/          # профили агентов, workflows, hooks
├── mcp/                          # конфиги портов/серверов
├── scripts/                      # утилиты (reindex, export, publish)
├── docs/                         # гайды, принципы, examples
└── README.md

Documentation

Setup: как завести Vault, синк, приватность, базовые папки

Conventions: нейминг/теги/типы файлов/шаблоны

Workflows: research → synthesis → publish; studio pipelines (image/audio)

MCP Ports: список поддерживаемых инструментов и как подключать

License

MIT
