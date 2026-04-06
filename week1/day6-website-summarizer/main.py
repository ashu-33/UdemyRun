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
