# sonpiaz's Homebrew Tap

Homebrew tap for Son Piaz's macOS tools.

## Install

```bash
brew tap sonpiaz/tap
```

## Packages

### Formulae (CLI tools)

| Tool | Description | Install |
|-----|-------------|---------|
| **watch-cli** | Turn any social video into an architecture diagram or working component | `brew install sonpiaz/tap/watch-cli` |

### Casks (macOS apps)

| App | Description | Install |
|-----|-------------|---------|
| **Kapt** | Screenshot tool with annotation, OCR, and scrolling capture | `brew install --cask sonpiaz/tap/kapt` |
| **Yap** | Push-to-talk dictation for macOS | `brew install --cask sonpiaz/tap/yap` |

### Quick install (no tap needed)

```bash
brew install sonpiaz/tap/watch-cli
brew install --cask sonpiaz/tap/kapt
brew install --cask sonpiaz/tap/yap
```

## Update

```bash
brew update
brew upgrade --cask kapt yap
```

## Uninstall

```bash
brew uninstall --cask kapt
brew uninstall --cask yap

# Remove user data too
brew uninstall --cask --zap kapt
brew uninstall --cask --zap yap
```
