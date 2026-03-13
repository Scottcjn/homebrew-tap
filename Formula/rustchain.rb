class Rustchain < Formula
  desc "Proof-of-Antiquity blockchain miner for RustChain (RTC)"
  homepage "https://github.com/Scottcjn/Rustchain"
  url "https://raw.githubusercontent.com/Scottcjn/Rustchain/main/miners/macos/rustchain_mac_miner_v2.4.py"
  version "2.4.0"
  sha256 "a6ca74ccae44ec4a31b836d33ea2626ae6067e15f7819d43c1d6f06a20c7747b"
  license "Apache-2.0"

  depends_on "python@3.10"
  depends_on "requests"

  def install
    # Create installation directory structure
    libexec.install "rustchain_mac_miner_v2.4.py" => "rustchain_miner.py"
    
    # Download fingerprint checks
    libexec.install "https://raw.githubusercontent.com/Scottcjn/Rustchain/main/miners/linux/fingerprint_checks.py"
    
    # Create wrapper script
    (bin/"rustchain").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3.10"].opt_bin}/python3" "#{libexec}/rustchain_miner.py" "$@"
    EOS
    
    # Create start script
    (bin/"rustchain-start").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["python@3.10"].opt_bin}/python3" "rustchain_miner.py" --wallet "${RUSTCHAIN_WALLET:-default}"
    EOS
    
    chmod 0755, bin/"rustchain"
    chmod 0755, bin/"rustchain-start"
  end

  def post_install
    # Create data directory
    (var/"lib/rustchain").mkpath
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"rustchain", :executable?
    
    # Test help output
    output = shell_output("#{bin}/rustchain --help 2>&1 || true")
    assert_match(/wallet/, output)
    
    # Test Python can import requests
    system "#{Formula["python@3.10"].opt_bin}/python3", "-c", "import requests"
  end

  def caveats
    <<~EOS
      RustChain miner has been installed successfully.
      
      To start mining:
        1. Set your wallet: export RUSTCHAIN_WALLET=your-wallet-name
        2. Run: rustchain-start
      
      Or run directly with wallet:
        rustchain --wallet your-wallet-name
      
      For more information, visit:
        https://github.com/Scottcjn/Rustchain
      
      To check your balance:
        curl -sk "https://rustchain.org/wallet/balance?miner_id=your-wallet-name"
    EOS
  end
end
