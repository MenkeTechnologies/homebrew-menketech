class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.15/awkrs-v0.4.15-aarch64-apple-darwin.tar.gz"
      sha256 "c82140f9e07c2213c86c4ca2096a066e3bfe78b4bfab902c1ff4505b5df43dfb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.15/awkrs-v0.4.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bcc04e52fc5c55890480e15d34c3380287f3abe7808522fdee2c3375b4e6357"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.15/awkrs-v0.4.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7cfad4244fce02f67baaeef34bf0169cb034443943f3478b45d5bc3b0eb564b4"
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
