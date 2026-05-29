class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.5"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.5/storageshower-v0.28.5-aarch64-apple-darwin.tar.gz"
    sha256 "a460bbc4f30d1104e062f9c0d462cb2db305f274c40995d5915e20cbd0fe749f"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.5/storageshower-v0.28.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e236b7a4d74c34cfe434a82906bd38a08ddc2ebc3494354ba73d09f10f2a7613"
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
