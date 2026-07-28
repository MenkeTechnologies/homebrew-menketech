class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.32"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.32/ztmux-v3.7.32-aarch64-apple-darwin.tar.gz"
      sha256 "a00d0d2b32e34b79a9446d6acdf9cb78ec3200cb419c75598cc62e8a4882d597"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.32/ztmux-v3.7.32-x86_64-apple-darwin.tar.gz"
      sha256 "892ae5492e7f1ab0be50055bc3849c65020247a29ffc57059ba5da8a024b9660"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.32/ztmux-v3.7.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03fa72920c60e3e5f9ee6374c34a56ad102382d40bce970cefe071d1f9f9c4b4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.32/ztmux-v3.7.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "531c3f7fdd4bf039751ad18a748adde731154dc7c7f5fcdb492f7e7d4b9241d4"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
