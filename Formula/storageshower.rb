class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.4"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.4/storageshower-v0.28.4-aarch64-apple-darwin.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.4/storageshower-v0.28.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end
  end

  def install
  bin.install "storageshower"
  end

  test do
    # TUI binary — --version is the contract we test (no interactive launch in CI).
    assert_match version.to_s, shell_output("#{bin}/storageshower --version 2>&1", 0..2)
  end
end
