class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.16/iftoprs-v2.22.16-aarch64-apple-darwin.tar.gz"
      sha256 "d2489081d69a07c8b91bda414a38ca8e911ced432accad8f174d838619153e1e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.16/iftoprs-v2.22.16-x86_64-apple-darwin.tar.gz"
      sha256 "aedd2a084bc7975a3e59b76419887f8c55c26f12b94740cb9b65c3709d0f39e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.16/iftoprs-v2.22.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c404d3b3a04ab97f38141bbd3292a79d1b8f6785daf10843787f1fbca5b816bb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.16/iftoprs-v2.22.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9a2aaf8a0705acb6eaceea81086f2dfdc8a0dd4b5eb14e03e1c7560413ef2fb"
    end
  end

  def install
    bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
