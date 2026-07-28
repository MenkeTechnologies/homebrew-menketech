class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.31"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.31/ztmux-v3.7.31-aarch64-apple-darwin.tar.gz"
      sha256 "92bbd8beb39c2098e1b17f22099ba4199ed1aca5eda3d41a62c8f36a88f74ad5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.31/ztmux-v3.7.31-x86_64-apple-darwin.tar.gz"
      sha256 "7b13d6dde090ade218a1f2171dc98542f48e3105a17f41e408714feea4857f6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.31/ztmux-v3.7.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac2f118c4f208127ca74f827b58b509d5969a54b65551146f59bcd6ccbdd5374"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.31/ztmux-v3.7.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36a2617f2c0ccbdecc48cb7c79b6daf2f17c47e64fc92a4abf3a81eaedeb5b61"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
