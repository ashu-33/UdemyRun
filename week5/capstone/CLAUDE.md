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
