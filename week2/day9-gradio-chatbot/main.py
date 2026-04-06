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
