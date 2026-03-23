# BCOS — Beacon Certified Open Source
# Homebrew formula for bcos command-line tool
# https://github.com/Scottcjn/Rustchain

class Bcos < Formula
  include Language::Python::Virtualenv

  desc "BCOS v2 Engine — Free & Open Source code certification"
  homepage "https://rustchain.org/bcos"
  url "https://files.pythonhosted.org/packages/70/cd/f0d1c63509d7730f656b027c4030a4d8c63143bed31f29cc25bbdc64d840/clawrtc-1.8.0.tar.gz"
  sha256 "19476314339684e699af0c5e26ea54bf3edb19bf1837725dc919df39a366f484"
  license "MIT"

  depends_on "python@3"

  # Optional dependencies for enhanced scanning
  # These are not required for basic BCOS functionality
  # Users can install separately: brew install semgrep
  # pip-audit is installed automatically with the package

  def install
    # Install clawrtc package with all dependencies
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install_and_link(buildpath)

    # Create bcos wrapper script
    (bin/"bcos").write <<~EOS
      #!/bin/bash
      # BCOS v2 Engine wrapper
      # https://github.com/Scottcjn/Rustchain
      exec "#{libexec}/bin/clawrtc" bcos "$@"
    EOS
    chmod 0755, bin/"bcos"
  end

  test do
    # Test that bcos command is available
    assert_match "BCOS", shell_output("#{bin}/bcos --help 2>&1 || true")

    # Test version output
    output = shell_output("#{bin}/clawrtc --version")
    assert_match "1.8.0", output

    # Test BCOS scan on a simple directory
    mkdir "test_repo" do
      write_file "test.py", "# SPDX-License-Identifier: MIT\nprint('hello')"
      output = shell_output("#{bin}/bcos scan . 2>&1 || true")
      assert_match "Trust Score", output
    end
  end
end