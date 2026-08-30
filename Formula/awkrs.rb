class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.5/awkrs-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "de6cbb3aa2360377d04a532bd576f95c9a275c55b333cc68c4bc1b5812f72045"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.5/awkrs-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1779c6ca822e3c794218af94595150c5646c14ad4b0037df61d15c59ea4e8b4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.5/awkrs-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "291420fd3cf6f4f3e82ecf4670711afc5e46cf57d083f1dd0bea8b3eeab53056"
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
