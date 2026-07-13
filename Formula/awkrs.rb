class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.19/awkrs-v0.4.19-aarch64-apple-darwin.tar.gz"
      sha256 "67468ea0388c3c563b60fb8c05a3e91ed8918f5ba868ce2420a3c8a5ebf16863"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.19/awkrs-v0.4.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb7bc9a7b05a723e3840bd10582a79a71466336c1e616528359ee1fac0bbcac2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.19/awkrs-v0.4.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1d87b306a22d06cf5eaaf7182fd4ec69656b190585c437f9f4d82570d5749a0"
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
