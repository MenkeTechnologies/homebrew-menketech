class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.3/htoprs-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "429b8c88b528c2b2802c0604204d41feb0e06d448df93a65fb3ed2ebe9755d7e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.3/htoprs-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "67b18249e64e00cb09b3a8d7b020597336db735f009e4d672e59afbfce7c5edb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.3/htoprs-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36e22ce2a7ad4d2a47102ed62de0678cb5e1ccbc788c0325a7145de77d134292"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.3/htoprs-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18d8104dae73d3e9c1c8f60f936dad7ebf26a8b19882ed77cbde660a08bd2e96"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
