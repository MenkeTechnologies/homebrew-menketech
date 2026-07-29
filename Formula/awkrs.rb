class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.21/awkrs-v0.4.21-aarch64-apple-darwin.tar.gz"
      sha256 "518cefcb972344127e0ca5d057dd50536ece15e43295d8c584dfdbf50c6d623f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.21/awkrs-v0.4.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b07b4efe7a446b97698e6ddb31fcf7cace91d4d6f61e7c98392e9380312b5f2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.21/awkrs-v0.4.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ad5e7e4b42fa34a533ecc5d046625bab48684a484a5591cd53b935742385b06"
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
