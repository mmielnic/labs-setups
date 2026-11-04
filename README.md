# Labs Setups

Markdown notes on how each of my lab environments is set up: Kubernetes clusters, OpenTelemetry collectors, and Coralogix integrations.

> **Status:** test README. The structure below is a starting point and will change as labs are added.

## Layout

Each lab gets its own folder with a `README.md`:

```text
labs-setups/
├── README.md
└── <lab-name>/
    └── README.md
```

## What to put in a lab's README

- **Goal:** what the lab is meant to show or test
- **Environment:** cluster type (such as kind or Colima), namespaces, chart and app versions
- **Setup steps:** the commands, in order
- **Configuration:** Helm values, overrides, and the environment variables used (names only, never values)
- **Validation:** how to confirm that data reaches Coralogix (logs, traces, metrics)
- **Issues and fixes:** what went wrong, how it was found, and what fixed it

## Labs

| Lab | Description | Status |
|---|---|---|
| *(none yet)* | | |

## Secrets

Never commit API keys, credential files, or `.env` files. The following are ignored by git:

- `.env`
- `credentials.json`
- `*_keys.txt`
