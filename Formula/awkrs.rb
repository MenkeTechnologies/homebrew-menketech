class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.16/awkrs-v0.4.16-aarch64-apple-darwin.tar.gz"
      sha256 "8358bff3b9668b17ebf60f0cd89d61d618a02e32b7aabe209c97b2e4eb30d849"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.16/awkrs-v0.4.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2863da0efa007ab2a7c272212964ce3d7a9d94c6e9cde3211cce64736f91a782"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.16/awkrs-v0.4.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ad0e435c32f76cda95a5451dadef2cc10c886b1df1fdb046e4553d84d18c493"
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
