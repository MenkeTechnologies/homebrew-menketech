class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.7/awkrs-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "23c92417701a9c35b046f90a6e3b70d49e01395976c95b81a9d545e8ee5229f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.7/awkrs-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe8fef317c59590a1fb93457c3d5b84f0f7288ea02c64a2b605e381cda205c3b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.7/awkrs-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ac7df0545e1f904e34c8ad4a26376315a358cc7a207b6668f3157006edebb63"
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
