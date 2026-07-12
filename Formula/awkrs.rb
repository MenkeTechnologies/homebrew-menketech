class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.18/awkrs-v0.4.18-aarch64-apple-darwin.tar.gz"
      sha256 "ef7f1974d420e1397184607149b2cd4f9dd48850991acd627d9bc0679c8ee4d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.18/awkrs-v0.4.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c23b8a561f2486a1ef155f56d3d14bae489236ebda967918b96d170f683cee3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.18/awkrs-v0.4.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ddaafc87b235b4c7375ed29828d0496270e0693116b37c0789881dd0804b878"
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
