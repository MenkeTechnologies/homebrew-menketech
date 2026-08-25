class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.1/awkrs-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "eeca5a198095122bcad685a17c235d8aa2c8191c86ad42412ddd4a4d96dac645"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.1/awkrs-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b498779ef8688f22c319f23ff7379ce8df1719f8d87b18163cd1461ae8acda7a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.5.1/awkrs-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "edd43cd761d8f71b4368c710d2a358fa25139fc6c74d7edecf42412f917b39d0"
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
