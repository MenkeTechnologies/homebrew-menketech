class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.0/awkrs-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "6d1bf1409377092cadc877ac5c0100d45063291ee7cc69cff684079f389b145b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.0/awkrs-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3be4cc126fb86ba92855c8811302c4ec259cce39fcc544335699e1dccaf062fe"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.0/awkrs-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9ffe1e73f4d4c78f5853cead28872f2fcc0c521d4f0d036e415c73b2be9e311"
    end
  end

  def install
    bin.install "awkrs"
    bin.install "aw"
  end

  test do
    assert_match "hi", shell_output("echo hi | #{bin}/awkrs \x27{print}\x27").strip
  end
end
