class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.7/storageshower-v0.28.7-aarch64-apple-darwin.tar.gz"
      sha256 "9ae3037e43beca6dcfa36869502050fcf897af598c0d66d5214fef9a7d951c2d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.7/storageshower-v0.28.7-x86_64-apple-darwin.tar.gz"
      sha256 "93c566f369063818690d424308e22ec7a77c0417261c3ef98fa21cb3043cbd44"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.7/storageshower-v0.28.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8662e1c9e803e5a31c8d8724ceb24cd6461f214d196829e05b19a324c3a6f154"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.7/storageshower-v0.28.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51213bf11dd813c79039c2080e2ca72eff66546b7baf63096b5e2e27c4e1a778"
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
