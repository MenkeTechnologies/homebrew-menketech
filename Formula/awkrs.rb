class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.8/awkrs-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "a2cf4199d861d0805b5807dc315a744e3dc885a755c55fa0cc3ac993e47f450e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.8/awkrs-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a722324b3296d47bf053451cf4382bb006958c9306a005ed65aaa259f07af43b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.8/awkrs-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "623df01fff08ce289f665c0d23d1fd29fa7e37b3755c69fe812599393e576656"
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
