class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.16"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.16/ztmux-v3.7.16-aarch64-apple-darwin.tar.gz"
      sha256 "4e102926ec5ebee0582a90c188b7d401a5b27854ff81ea202b250a15f65d2250"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.16/ztmux-v3.7.16-x86_64-apple-darwin.tar.gz"
      sha256 "0627570a68f7cd5419d0bce64c69895ea0c7736906bc807b5444668afb257083"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.16/ztmux-v3.7.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf0b047b0c3342cd94482a71ce2df72bca2d1858b3635d2b7113637f7a483e1f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.16/ztmux-v3.7.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d361106bb36742cc16344cb863b9b075261ed9af78f06c6eea88bc84352ce8cd"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
