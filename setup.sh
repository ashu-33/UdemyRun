#!/bin/bash

# ============================================================
#  AI Upskill 5-Week Roadmap — Project Setup Script
#  Run this ONCE before Day 1 to scaffold everything
# ============================================================

set -e

echo "================================================"
echo "  AI Upskill 5-Week Roadmap — Setup"
echo "================================================"
echo ""

# ---------- PRE-FLIGHT CHECKS ----------
echo "[1/7] Checking prerequisites..."
echo ""

check_cmd() {
    if command -v "$1" &> /dev/null; then
        echo "  ✅ $1 found: $($1 --version 2>&1 | head -1)"
    else
        echo "  ❌ $1 NOT FOUND — install before continuing"
        echo "     $2"
        MISSING=1
    fi
}

MISSING=0
check_cmd python3 "Download from https://python.org (3.11 or 3.12)"
check_cmd git "macOS: xcode-select --install | Windows: winget install Git.Git"
check_cmd uv "curl -LsSf https://astral.sh/uv/install.sh | sh"
check_cmd node "brew install node OR winget install OpenJS.NodeJS.LTS"
check_cmd ollama "Download from https://ollama.com"

echo ""
if [ "$MISSING" -eq 1 ]; then
    echo "⚠️  Some tools are missing. Install them first, then re-run this script."
    echo "   (You can still continue — missing tools are only needed later)"
    echo ""
fi

# ---------- API KEY CHECKS ----------
echo "[2/7] Checking API keys..."
echo ""

check_key() {
    if [ -n "${!1}" ]; then
        echo "  ✅ $1 is set"
    else
        echo "  ⚠️  $1 not set — add to your shell profile before Day $2"
        echo "     $3"
    fi
}

check_key OPENAI_API_KEY 1 "Get at https://platform.openai.com/api-keys"
check_key ANTHROPIC_API_KEY 5 "Get at https://console.anthropic.com"
check_key GOOGLE_API_KEY 5 "Get at https://aistudio.google.com/apikey"
check_key HF_TOKEN 7 "Get at https://huggingface.co/settings/tokens"

echo ""

# ---------- CREATE FOLDER STRUCTURE ----------
echo "[3/7] Creating project structure..."
echo ""

ROOT="$(pwd)"

# Week 1 — Python foundations
mkdir -p week1/day1-task-manager-cli
mkdir -p week1/day2-enhanced-task-manager
mkdir -p week1/day3-file-task-manager
mkdir -p week1/day4-functions-errors
mkdir -p week1/day5-modular-task-manager
mkdir -p week1/day6-website-summarizer
mkdir -p week1/day6-custom-summarizer
mkdir -p week1/day6-ollama-chat
mkdir -p week1/day7-brochure-generator

# Week 2 — LLM engineering
mkdir -p week2/day8-llm-comparison
mkdir -p week2/day9-gradio-chatbot
mkdir -p week2/day10-deployed-chatbot
mkdir -p week2/day11-task-manager-gui
mkdir -p week2/day12-weather-api
mkdir -p week2/day13-huggingface-models
mkdir -p week2/day13-weather-dashboard
mkdir -p week2/day13-news-summarizer
mkdir -p week2/day14-chatbot-v2

# Week 3 — RAG + Agents
mkdir -p week3/day16-rag-document-qa
mkdir -p week3/day17-advanced-rag
mkdir -p week3/day18-first-agent
mkdir -p week3/day19-multi-model-eval
mkdir -p week3/day20-career-chatbot
mkdir -p week3/day20-langchain-agent
mkdir -p week3/day20-multi-agent-pipeline
mkdir -p week3/day21-rag-research-assistant

# Week 4 — AI Coding + MCP
mkdir -p week4/day22-ai-game
mkdir -p week4/day23-kanban-copilot
mkdir -p week4/day24-personal-website
mkdir -p week4/day25-claude-code-rebuild
mkdir -p week4/day26-mcp-server
mkdir -p week4/day27-fullstack-kanban
mkdir -p week4/day28-speed-build-1
mkdir -p week4/day28-speed-build-2
mkdir -p week4/day28-speed-build-3

# Week 5 — Advanced + Capstone
mkdir -p week5/day30-fine-tuned-model
mkdir -p week5/day31-multi-agent-system
mkdir -p week5/capstone

echo "  ✅ All project folders created"
echo ""

# ---------- ROOT FILES ----------
echo "[4/7] Creating root configuration files..."
echo ""

# .gitignore
cat > .gitignore << 'GIT'
# Python
__pycache__/
*.pyc
*.pyo
.venv/
venv/
*.egg-info/

# Environment
.env
.env.local

# IDE
.vscode/settings.json
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Models (too large for git)
*.bin
*.safetensors
*.gguf

# Node
node_modules/

# Data
*.pdf
*.csv
!sample-data/*.csv
chroma_db/
vector_store/
GIT

# .env template
cat > .env.example << 'ENV'
# Copy this to .env and fill in your keys
# NEVER commit .env to git!

OPENAI_API_KEY=sk-your-key-here
ANTHROPIC_API_KEY=sk-ant-your-key-here
GOOGLE_API_KEY=your-key-here
HF_TOKEN=hf_your-token-here
OPENROUTER_API_KEY=sk-or-your-key-here
ENV

# Root README
cat > README.md << 'README'
# AI Upskill — 5-Week Learning Roadmap

A hands-on journey from Python basics to building AI agents, RAG pipelines, and full-stack AI applications.

## Structure

```
week1/   → Python foundations + first LLM API calls
week2/   → LLM engineering + chatbots + REST APIs
week3/   → RAG pipelines + AI agents + tool calling
week4/   → AI coding tools + MCP + full-stack builds
week5/   → Fine-tuning + multi-agents + capstone
```

## Setup

```bash
# 1. Clone this repo
git clone https://github.com/YOUR-USERNAME/ai-upskill-5weeks.git
cd ai-upskill-5weeks

# 2. Copy env template and add your API keys
cp .env.example .env

# 3. Run setup script
chmod +x setup.sh
./setup.sh
```

## Progress

| Week | Theme | Projects | Status |
|------|-------|----------|--------|
| 1 | Python + first LLM calls | 7 | ⬜ |
| 2 | LLM engineering + real apps | 8 | ⬜ |
| 3 | RAG + agents + tools | 7 | ⬜ |
| 4 | AI coding + MCP + full-stack | 8 | ⬜ |
| 5 | Fine-tuning + capstone | 4 | ⬜ |

## Resources

- [Python Mega Course](https://www.udemy.com) — Sections 1-25
- [AI Engineer Core Track](https://www.udemy.com) — Weeks 1-8
- [AI Engineer Agentic Track](https://www.udemy.com) — Weeks 1-6
- [AI Coder Course](https://www.udemy.com) — Weeks 1-3
README

echo "  ✅ Root files created (.gitignore, .env.example, README.md)"
echo ""

# ---------- WEEK READMES ----------
echo "[5/7] Creating weekly README files..."
echo ""

cat > week1/README.md << 'W1'
# Week 1 — Python Foundations + First LLM Calls

## Goal
Go from basic Python to making your first LLM API calls.

## Daily Builds
| Day | Build | Status |
|-----|-------|--------|
| D1 Mon | Task manager CLI v1 | ⬜ |
| D2 Tue | Enhanced task manager with numbered display | ⬜ |
| D3 Wed | Task manager with file save/load | ⬜ |
| D4 Thu | Task manager with error handling + functions | ⬜ |
| D5 Fri | Modular task manager + pushed to GitHub | ⬜ |
| D6 Sat | Website summarizer + custom variant + Ollama chat | ⬜ |
| D7 Sun | AI brochure generator with streaming | ⬜ |

## Self-Test (Day 7)
1. Write a script that reads a CSV, filters rows, writes output — no AI help, under 15 min
2. Write a script that calls OpenAI API with streaming — from memory

**Pass both = ready for Week 2**
W1

cat > week2/README.md << 'W2'
# Week 2 — LLM Engineering + First Real Apps

## Goal
Build multi-model chatbots with UIs that others can actually use.

## Daily Builds
| Day | Build | Status |
|-----|-------|--------|
| D8 Mon | LLM competition/comparison tool | ⬜ |
| D9 Tue | Multi-modal Gradio chatbot | ⬜ |
| D10 Wed | Deployed chatbot on HuggingFace | ⬜ |
| D11 Thu | Task manager: GUI + web versions | ⬜ |
| D12 Fri | Weather REST API | ⬜ |
| D13 Sat | HF models + weather dashboard + news summarizer | ⬜ |
| D14 Sun | Enhanced chatbot v2 (multi-model, deployed) | ⬜ |

## Self-Test (Day 14)
Build a NEW Gradio app from scratch in 60 min. No tutorial. Just you + API docs.

**If it works and deploys = ready for Week 3**
W2

cat > week3/README.md << 'W3'
# Week 3 — RAG + Agents + Tool Calling

## Goal
Build RAG pipelines and autonomous AI agents — the two most in-demand AI skills.

## Daily Builds
| Day | Build | Status |
|-----|-------|--------|
| D15 Mon | (Theory day — detailed notes) | ⬜ |
| D16 Tue | Document Q&A system with ChromaDB | ⬜ |
| D17 Wed | Improved RAG pipeline (chunk comparison) | ⬜ |
| D18 Thu | First agentic workflow | ⬜ |
| D19 Fri | Multi-model evaluation system | ⬜ |
| D20 Sat | Career chatbot + LangChain agent + multi-agent | ⬜ |
| D21 Sun | RAG research assistant with tool calling | ⬜ |

## Self-Test (Day 21)
1. Feed a new PDF through RAG. Ask 5 questions. Rate answers 1-5. Average > 3?
2. Build a new agent with 2 tools requiring multi-step reasoning. Does it succeed?
W3

cat > week4/README.md << 'W4'
# Week 4 — AI Coding Tools + MCP + Full-Stack

## Goal
Master AI-assisted development. Ship apps 5x faster.

## Daily Builds
| Day | Build | Status |
|-----|-------|--------|
| D22 Mon | 3D browser game (AI-generated) | ⬜ |
| D23 Tue | Kanban board with GitHub Copilot | ⬜ |
| D24 Wed | Personal website with AI chat | ⬜ |
| D25 Thu | Earlier project rebuilt with Claude Code | ⬜ |
| D26 Fri | MCP server connected to agent | ⬜ |
| D27 Sat | Full-stack Kanban (FastAPI + Docker) | ⬜ |
| D28 Sun | 3 speed-built apps (your ideas) | ⬜ |

## Self-Test (Day 28)
Empty folder → working web app with LLM integration. Under 2 hours with AI tools?
W4

cat > week5/README.md << 'W5'
# Week 5 — Advanced Topics + Capstone

## Goal
Fine-tuning, multi-agents, and a portfolio-worthy capstone.

## Daily Builds
| Day | Build | Status |
|-----|-------|--------|
| D29 Mon | (Theory: ML → DL → fine-tuning decision framework) | ⬜ |
| D30 Tue | Fine-tuned model (before/after comparison) | ⬜ |
| D31 Wed | Multi-agent collaboration system | ⬜ |
| D32 Thu | (Study: orchestration patterns) | ⬜ |
| D33 Fri | Capstone spec + CLAUDE.md + architecture | ⬜ |
| D34 Sat | Capstone MVP — working prototype | ⬜ |
| D35 Sun | Deployed capstone with documentation | ⬜ |

## Final Self-Test
Go back to Week 1 objectives. Check each honestly. Show capstone to someone.
Can you explain every layer? Can you build the next thing without a tutorial?
W5

echo "  ✅ Weekly README files created"
echo ""

# ---------- STARTER FILES ----------
echo "[6/7] Creating starter files for key projects..."
echo ""

# Week 1 Day 1 starter
cat > week1/day1-task-manager-cli/main.py << 'PY1'
"""
Day 1 — Task Manager CLI v1
Python Mega Course Sections 1-2

YOUR GOAL: Build a simple task manager that:
- Asks user for a task
- Adds it to a list
- Shows all tasks
- Runs in a loop until user types 'quit'
"""

# Start coding here:
tasks = []

while True:
    action = input("Type add, show, or quit: ")

    if action == "quit":
        break
    # TODO: implement add and show

print("Goodbye!")
PY1

# Week 1 Day 6 — Website summarizer starter
cat > week1/day6-website-summarizer/main.py << 'PY6'
"""
Day 6 — Website Summarizer
LLM Core Track Week 1 Day 1 Lectures 9-11

YOUR GOAL: Build a script that:
1. Takes a URL as input
2. Fetches the page content
3. Sends it to OpenAI API
4. Returns a summary
"""

import os
from dotenv import load_dotenv

load_dotenv()

# Verify API key is loaded
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    print("ERROR: Set OPENAI_API_KEY in your .env file")
    exit(1)

from openai import OpenAI

client = OpenAI()

# TODO: Build your summarizer here
# 1. Get URL from user
# 2. Fetch page content (use requests + beautifulsoup4)
# 3. Send to OpenAI with a system prompt
# 4. Print the summary
PY6

# Week 1 Day 6 — requirements
cat > week1/day6-website-summarizer/pyproject.toml << 'TOML6'
[project]
name = "website-summarizer"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = [
    "openai",
    "python-dotenv",
    "requests",
    "beautifulsoup4",
]
TOML6

# Week 2 Day 9 — Gradio chatbot starter
cat > week2/day9-gradio-chatbot/main.py << 'PY9'
"""
Day 9 — Multi-Modal Gradio Chatbot
LLM Core Track Week 2

YOUR GOAL: Build a chatbot with Gradio that:
1. Has a chat interface
2. Connects to OpenAI
3. Maintains conversation history
4. (Stretch) Handles image uploads
"""

import os
import gradio as gr
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
client = OpenAI()

def chat(message, history):
    """Process a chat message and return response."""
    messages = [{"role": "system", "content": "You are a helpful assistant."}]

    for h in history:
        messages.append({"role": "user", "content": h[0]})
        if h[1]:
            messages.append({"role": "assistant", "content": h[1]})

    messages.append({"role": "user", "content": message})

    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=messages,
    )
    return response.choices[0].message.content

# TODO: Launch Gradio interface
# demo = gr.ChatInterface(fn=chat, title="My AI Chatbot")
# demo.launch()
PY9

cat > week2/day9-gradio-chatbot/pyproject.toml << 'TOML9'
[project]
name = "gradio-chatbot"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = [
    "openai",
    "python-dotenv",
    "gradio",
]
TOML9

# Week 3 Day 16 — RAG starter
cat > week3/day16-rag-document-qa/main.py << 'PY16'
"""
Day 16 — RAG Document Q&A
LLM Core Track Week 5

YOUR GOAL: Build a RAG pipeline that:
1. Loads a PDF document
2. Chunks the text
3. Creates embeddings
4. Stores in ChromaDB
5. Queries with natural language
6. Returns LLM-generated answers with source context
"""

import os
from dotenv import load_dotenv

load_dotenv()

# TODO: Build your RAG pipeline here
# Step 1: Load document (try PyPDF2 or pdfplumber)
# Step 2: Chunk text (try recursive character splitter)
# Step 3: Create embeddings (OpenAI or HuggingFace)
# Step 4: Store in ChromaDB
# Step 5: Query function
# Step 6: Generate answer with context
PY16

cat > week3/day16-rag-document-qa/pyproject.toml << 'TOML16'
[project]
name = "rag-document-qa"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = [
    "openai",
    "python-dotenv",
    "chromadb",
    "langchain",
    "langchain-openai",
    "langchain-community",
    "pypdf2",
]
TOML16

# Week 3 Day 21 — Research assistant starter
cat > week3/day21-rag-research-assistant/main.py << 'PY21'
"""
Day 21 — RAG Research Assistant (Integration Project)
Combines: RAG + Agent + Tool Calling + Web Search

YOUR GOAL: Build an assistant that:
1. Ingests your documents (PDFs, text files)
2. Answers questions from documents (RAG)
3. Falls back to web search when docs don't have the answer
4. Has a Gradio UI
5. Maintains conversation history
"""

# This is your first "real" integration project.
# Use everything you've learned in Weeks 1-3.
# There's no tutorial for this — design it yourself.
PY21

# Week 5 Capstone
cat > week5/capstone/SPEC.md << 'SPEC'
# Capstone Project Specification

## Fill this out on Day 33 (Friday of Week 5)

### Project Name
<!-- What are you building? -->

### Problem Statement
<!-- What problem does this solve? Who would use it? -->

### Architecture
<!-- Draw the components:
- Frontend (Gradio/Streamlit/React?)
- Backend (FastAPI/Flask?)
- Data layer (ChromaDB/SQLite?)
- LLM integration (which models?)
- Agent logic (what tools?)
-->

### Core Features (MVP)
<!-- What MUST work for this to be useful?
1.
2.
3.
-->

### Stretch Goals
<!-- Nice to have if time permits
1.
2.
-->

### Tech Stack
<!-- List every tool/library you'll use -->

### API Keys Needed
<!-- Which services does this connect to? -->
SPEC

cat > week5/capstone/CLAUDE.md << 'CLAUDE'
# CLAUDE.md — Capstone Project

## Project Overview
<!-- Describe what this project does in 2-3 sentences -->

## Tech Stack
- Python 3.12
- <!-- Add your stack here -->

## Architecture
<!-- Describe the main components and how they connect -->

## Coding Standards
- Use type hints on all function signatures
- Write docstrings for all public functions
- Handle errors gracefully — never crash on user input
- Use .env for all API keys — never hardcode
- Keep functions under 30 lines
- Use UV for package management

## File Structure
```
capstone/
├── main.py          # Entry point
├── app.py           # Web UI (Gradio/Streamlit)
├── agent.py         # Agent logic + tools
├── rag.py           # RAG pipeline
├── config.py        # Configuration + env loading
├── pyproject.toml   # Dependencies
├── .env             # API keys (gitignored)
└── README.md        # Documentation
```

## Current Status
<!-- Update this as you build -->
- [ ] Spec written
- [ ] Architecture designed
- [ ] Project scaffolded
- [ ] RAG pipeline working
- [ ] Agent logic working
- [ ] UI working
- [ ] Deployed
- [ ] README written
CLAUDE

echo "  ✅ Starter files created for key projects"
echo ""

# ---------- VS CODE WORKSPACE ----------
echo "[7/7] Creating VS Code workspace..."
echo ""

cat > ai-upskill.code-workspace << 'VSCODE'
{
    "folders": [
        { "path": "week1", "name": "📘 Week 1 — Python + LLM Basics" },
        { "path": "week2", "name": "📗 Week 2 — LLM Engineering" },
        { "path": "week3", "name": "📙 Week 3 — RAG + Agents" },
        { "path": "week4", "name": "📕 Week 4 — AI Tools + MCP" },
        { "path": "week5", "name": "📓 Week 5 — Advanced + Capstone" },
        { "path": ".", "name": "⚙️ Root Config" }
    ],
    "settings": {
        "python.defaultInterpreterPath": "python3",
        "python.terminal.activateEnvironment": true,
        "editor.formatOnSave": true,
        "editor.rulers": [88],
        "files.exclude": {
            "**/__pycache__": true,
            "**/.DS_Store": true,
            "**/node_modules": true
        },
        "files.associations": {
            "*.md": "markdown"
        }
    },
    "extensions": {
        "recommendations": [
            "ms-python.python",
            "ms-python.debugpy",
            "ms-toolsai.jupyter",
            "tamasfe.even-better-toml",
            "github.copilot",
            "github.copilot-chat"
        ]
    }
}
VSCODE

echo "  ✅ VS Code workspace file created"
echo ""

# ---------- INIT GIT ----------
echo "================================================"
echo "  ✅ Setup complete!"
echo "================================================"
echo ""
echo "  Next steps:"
echo ""
echo "  1. Copy your API keys:"
echo "     cp .env.example .env"
echo "     # Edit .env with your actual keys"
echo ""
echo "  2. Open in VS Code:"
echo "     code ai-upskill.code-workspace"
echo ""
echo "  3. Initialize git:"
echo "     git init"
echo "     git add ."
echo "     git commit -m 'initial setup: 5-week roadmap scaffolded'"
echo ""
echo "  4. Create GitHub repo:"
echo "     gh repo create ai-upskill-5weeks --public --source=. --push"
echo "     # OR manually create on github.com then:"
echo "     # git remote add origin https://github.com/YOU/ai-upskill-5weeks.git"
echo "     # git branch -M main && git push -u origin main"
echo ""
echo "  5. Start Day 1:"
echo "     cd week1/day1-task-manager-cli"
echo "     code main.py"
echo ""
echo "  Happy building! 🚀"
