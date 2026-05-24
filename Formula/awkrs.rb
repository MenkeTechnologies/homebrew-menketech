class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.5"

  on_macos do
      on_arm do
        url "https://github.com/MenkeTechnologies/awkrs/releases/download/v#{version}/awkrs-v#{version}-aarch64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/awkrs/releases/download/v#{version}/awkrs-v#{version}-x86_64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  on_linux do
      on_intel do
        url "https://github.com/MenkeTechnologies/awkrs/releases/download/v#{version}/awkrs-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  def install
    bin.install "awkrs"
    bin.install "aw"
  end

  test do
    assert_match "hi", shell_output("echo hi | #{bin}/awkrs \'{print}\'").strip
  end
end
