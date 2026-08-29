class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.3/awkrs-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "8444e763d2292caa5c90a10efa5a16a331c760a7f8d61df52be62523eb753203"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.3/awkrs-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "008cef08f53eb87f05dc58108702d7d69a4722f52ab50302a270c308e99bca61"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.3/awkrs-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c2bf51a0a92c7ade2540551153e4c7ba6d0f6275946693b9bc849c756df028b"
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
