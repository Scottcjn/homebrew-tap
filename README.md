# Elyan Labs Homebrew Tap 🍺

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Homebrew](https://img.shields.io/badge/Homebrew-Tap-orange.svg)](https://brew.sh)

A [Homebrew](https://brew.sh) tap for Elyan Labs tools and utilities.

## Available Formulae

| Formula | Description | Version |
|---------|-------------|---------|
| `grazer` | 🐄 Claude Code skill for grazing worthy content across BoTTube, Moltbook, ClawCities, Clawsta, and ClawHub | Latest |
| `beacon` | 📡 Agent-to-agent ping tool with optional RTC value attachment | Latest |
| `clawrtc` | 🔗 RustChain RTC utilities and tools | Latest |

## Quick Start

### Prerequisites

- [Homebrew](https://brew.sh) installed on your macOS or Linux system

### Adding the Tap

```bash
brew tap Scottcjn/elyan-labs
```

Or using the full URL:

```bash
brew tap Scottcjn/homebrew-tap https://github.com/Scottcjn/homebrew-tap
```

### Installing Tools

Install individual tools:

```bash
# Install grazer
brew install grazer

# Install beacon
brew install beacon

# Install clawrtc
brew install clawrtc
```

Or install all tools at once:

```bash
brew install grazer beacon clawrtc
```

### Upgrading

To upgrade to the latest versions:

```bash
brew update
brew upgrade grazer beacon clawrtc
```

## Tool Descriptions

### 🐄 Grazer

A Claude Code skill that automatically discovers and curates interesting content from multiple platforms in the RustChain ecosystem.

**Features:**
- Content aggregation from BoTTube, Moltbook, ClawCities, Clawsta, and ClawHub
- Intelligent content filtering and ranking
- Integration with Claude Code for seamless workflow

**Usage:**
```bash
grazer --help
```

### 📡 Beacon

Agent-to-agent communication tool with optional RTC (RustChain Token) value attachment for incentivized interactions.

**Features:**
- UDP-based agent messaging
- Optional RTC token attachment
- Integration with BoTTube, Moltbook, and RustChain

**Usage:**
```bash
beacon --help
```

### 🔗 ClawRTC

Utilities and tools for working with RustChain RTC tokens and the broader ecosystem.

**Features:**
- RTC wallet management
- Transaction utilities
- Chain interaction tools

**Usage:**
```bash
clawrtc --help
```

## Development

### Local Installation

To install from a local clone of this repository:

```bash
git clone https://github.com/Scottcjn/homebrew-tap.git
cd homebrew-tap
brew install --build-from-source ./Formula/<formula-name>.rb
```

### Testing

Test a formula before submitting:

```bash
brew install --build-from-source ./Formula/grazer.rb
brew test grazer
brew audit --strict grazer
```

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Reporting Issues

If you encounter any issues with the formulae in this tap:

1. Check if the issue is with the tool itself (report to the tool's repository)
2. For packaging issues, [open an issue](https://github.com/Scottcjn/homebrew-tap/issues/new) in this repository

### Requesting New Formulae

To request a new formula be added to this tap:

1. [Open an issue](https://github.com/Scottcjn/homebrew-tap/issues/new) describing the tool
2. Include links to the tool's repository and any relevant documentation
3. Ensure the tool has a stable release and proper licensing

## Documentation

- [Homebrew Documentation](https://docs.brew.sh)
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Ruby Style Guide for Formulae](https://rubystyle.guide/)

## Related Projects

- [RustChain](https://github.com/Scottcjn/Rustchain) - Proof-of-Antiquity blockchain
- [grazer-skill](https://github.com/Scottcjn/grazer-skill) - Source for the grazer tool
- [beacon-skill](https://github.com/Scottcjn/beacon-skill) - Source for the beacon tool

## License

This tap is available under the MIT License. See [LICENSE](LICENSE) for details.

Individual formulae are subject to their respective tool licenses.

## Acknowledgments

- [Homebrew](https://brew.sh) - The missing package manager for macOS (and Linux)
- [Elyan Labs](https://github.com/Scottcjn) - Creating tools for the AI agent ecosystem

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/Scottcjn">Elyan Labs</a>
</p>
