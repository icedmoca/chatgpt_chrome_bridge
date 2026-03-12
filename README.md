# chatgpt_chrome_bridge

> Automate ChatGPT interactions from the command line — over SSH, no API key required.
---

A lightweight Python bridge for scripting ChatGPT via a non-headless Chromium browser running on a remote host. Designed for SSH accessible Linux machines where you want to drive ChatGPT programmatically without touching the OpenAI API.

## Modes

- **`xdotool` (default)** — Attaches to any existing Chromium window using X11 automation. No browser restart needed; uses clipboard injection to handle special characters.
- **`cdp` (Playwright)** — Connects via Chrome DevTools Protocol for reliable DOM access, precise selector targeting, and streaming-aware response capture.

## Setup

**On the Chromium host:** 
### Requirements:

**xdotool mode:**
- `xdotool`
- `xclip`
```bash
pip install playwright && playwright install chromium
```

*(optional) fill in a custom chat url in chrome once running*
```bash
chromium --remote-debugging-port=9222 https://chatgpt.com
```

And/or use the included helper:
```bash
bash enable_chromium_debug.sh
```

## Usage
```bash
# xdotool mode (default)
python3 chatgpt_bridge.py "Your message here"

# CDP mode (recommended)
python3 chatgpt_bridge.py --mode cdp "Your message here"

# Custom wait timeout
python3 chatgpt_bridge.py --mode cdp --wait 60 "Your message here"
```

Example:
```python
.venv/bin/activate && timeout 120 python chatgpt_bridge.py --mode cdp --wait 120 "continue making our emergent language, I will respond back for you to respond back recursively"
```

## Use Cases

- Agentic pipelines using ChatGPT as an LLM node
- Local AI orchestration without API costs
- ChatGPT as a fallback or secondary model in multi-agent workflows
- Headless-adjacent browser automation over SSH

### Todo:

- [ ] Auto delete old doms (chatgpt lag fixer)
- [ ] Dynmaic wait time based on full message received
- [ ] model change support
