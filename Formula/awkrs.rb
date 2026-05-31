class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.13/awkrs-v0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "fd7f74e80563636daf64a239ac22d4b212585d35d0d0b9fbc3ca0cf22108f6fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.13/awkrs-v0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17720b7012b17315c39987b133e26f08b51f81c30d3d7b46292446cd7ba61d8d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.13/awkrs-v0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09f5a3a15f37892bc5141dbc530e793f920b5c4d7caad1e6879a8f65c65adab4"
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
