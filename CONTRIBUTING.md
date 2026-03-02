# Contributing to Elyan Labs Homebrew Tap

Thank you for your interest in contributing to the Elyan Labs Homebrew Tap! This document provides guidelines for contributing.

## How to Contribute

### Reporting Bugs

If you find a bug in any of the formulae:

1. **Check existing issues** - Search [existing issues](https://github.com/Scottcjn/homebrew-tap/issues) to avoid duplicates
2. **Use the latest version** - Ensure you're using the latest version of the formula
3. **Provide details** - Include:
   - macOS/Linux version
   - Homebrew version (`brew --version`)
   - Full error output
   - Steps to reproduce

### Requesting New Formulae

To request a new formula:

1. [Open an issue](https://github.com/Scottcjn/homebrew-tap/issues/new) with the label `formula-request`
2. Include:
   - Tool name and description
   - Link to the source repository
   - License information
   - Stable release URL

### Submitting Formula Updates

#### Setting Up Your Environment

1. Fork this repository on GitHub
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/homebrew-tap.git
   cd homebrew-tap
   ```
3. Create a new branch:
   ```bash
   git checkout -b update-formula-name
   ```

#### Formula Guidelines

Follow these guidelines when creating or updating formulae:

1. **Use the standard template:**
   ```ruby
   class ToolName < Formula
     desc "Short description of the tool"
     homepage "https://github.com/user/repo"
     url "https://github.com/user/repo/archive/v1.0.0.tar.gz"
     sha256 "..."
     license "MIT"
   
     depends_on "go" => :build  # or other build dependencies
   
     def install
       system "make", "build"
       bin.install "tool-name"
     end
   
     test do
       assert_match "version", shell_output("#{bin}/tool-name --version")
     end
   end
   ```

2. **Checklist before submitting:**
   - [ ] Formula passes `brew audit --strict formula-name`
   - [ ] Formula passes `brew test formula-name`
   - [ ] SHA256 checksum is correct
   - [ ] URL is accessible and versioned
   - [ ] Description is concise (max 80 characters)
   - [ ] Homepage is informative

3. **Version updates:**
   - Use `brew bump-formula-pr` when available
   - Include the version number in your commit message: `grazer 1.2.3`

#### Testing Your Changes

```bash
# Install your formula locally
brew install --build-from-source ./Formula/formula-name.rb

# Run tests
brew test formula-name

# Check for issues
brew audit --strict formula-name

# Check style
brew style formula-name
```

#### Commit Guidelines

- Use present tense: "Add grazer 1.0.0" not "Added grazer 1.0.0"
- Use imperative mood: "Move cursor to..." not "Moves cursor to..."
- Limit first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

Example:
```
grazer 1.2.3

- Update to latest release
- Add support for ClawHub platform
- Fixes #123
```

#### Submitting Your Changes

1. Push your branch:
   ```bash
   git push origin update-formula-name
   ```
2. [Create a Pull Request](https://github.com/Scottcjn/homebrew-tap/compare)
3. Fill out the PR template with:
   - Description of changes
   - Reason for changes
   - Testing performed

## Code of Conduct

This project adheres to a code of conduct:

- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback
- Respect different viewpoints and experiences

## Questions?

Feel free to [open an issue](https://github.com/Scottcjn/homebrew-tap/issues/new) with any questions!

## Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Homebrew Acceptable Formulae](https://docs.brew.sh/Acceptable-Formulae)
- [Homebrew Ruby Style Guide](https://rubystyle.guide/)

Thank you for contributing! 🍺
