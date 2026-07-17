class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.20/awkrs-v0.4.20-aarch64-apple-darwin.tar.gz"
      sha256 "1ff3feb34956a10a2196e5b6e03583f410ae3ee594d5f39e3b865760a84e5ca4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.20/awkrs-v0.4.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6170681fc06f3e7ea2a738561161814a624c81ed8d04f1a53a9cb9f674c97860"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.20/awkrs-v0.4.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4463f3c84a7d2507a5f1208bc2d9dbacd44fd72f003ac7315974bf929587a874"
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
