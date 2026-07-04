class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.8"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.8/ztmux-v3.7.8-aarch64-apple-darwin.tar.gz"
      sha256 "af538fa39fe0f07e03512ab2b15770d6ee036f8cd1cc426e0ecd5676ec03d093"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.8/ztmux-v3.7.8-x86_64-apple-darwin.tar.gz"
      sha256 "87ab8738b3af1c06816498c8f986df2b984d33b3ae96069b86db66d66bb0f9a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.8/ztmux-v3.7.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e25dae81affa341fbb35109542da54157c9d71e520db52177f96947c02c6ce60"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.8/ztmux-v3.7.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7871696bc213b12d87a56f0c2d43fe44ac7f0a40d09cc247b1f14cc1229920da"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
