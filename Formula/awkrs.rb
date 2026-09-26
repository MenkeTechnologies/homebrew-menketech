class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.6/awkrs-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "8f67be35120c4061223f06852eaa32e1f3a6ed35721ca12cb86c54728177856a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.6/awkrs-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a45c334251c6910af8be29dcf5b4844e9280e008bbfbb10b6d9e5eecfdce467"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.6/awkrs-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8304fbd3a76cda9f0191164749fed76b4eba9e302e4cf2c7ebcb7f687350031"
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
