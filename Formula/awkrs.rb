class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.17/awkrs-v0.4.17-aarch64-apple-darwin.tar.gz"
      sha256 "3de896bea90b38cf9f7b4dfe46d9d8ca461ceeca076fc6c6fb638c5724a955fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.17/awkrs-v0.4.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "782779d1777c0f9537dd3420d989b4bc58162f2c3183602c7da30b9ac55fcb4d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.17/awkrs-v0.4.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2d2259ea61c469a62c8be5a500c54a8565e923e31fb890bd85ba6acc5469373"
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
