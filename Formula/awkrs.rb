class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.14/awkrs-v0.4.14-aarch64-apple-darwin.tar.gz"
      sha256 "646db908a0c2851799e7d8a46f1374277f453ce27ce8232d5b492dad9554d4d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.14/awkrs-v0.4.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "122044e92915921bada82e6c5478c0666f128c6b1c5464a78128377f9cbeabc6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.14/awkrs-v0.4.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3618e951070f77e68617621e7315d444ff820c0b85de9e6ff02323cf72e93197"
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
