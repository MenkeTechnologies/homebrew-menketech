class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.2/awkrs-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "26a4c6b807ec62612a4e142f3b18fe49da09d7cfa4707a9ebb78e2e73f460699"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.2/awkrs-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a906cf9a051ad3e95e25451525e81ddaf8401d873f543db5d49f0926326cb477"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.2/awkrs-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bd5ff09be22cb16912970b1a8be1185cb48e3004c235cc47d0b13fb76927114"
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
