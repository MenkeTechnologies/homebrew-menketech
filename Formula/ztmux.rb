class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.4"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.4/ztmux-v3.7.4-aarch64-apple-darwin.tar.gz"
      sha256 "7beb1c644c0d413921a247968fe5962fc8d7c0e4535e47aa4cc81111dfd8eb7a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.4/ztmux-v3.7.4-x86_64-apple-darwin.tar.gz"
      sha256 "e80bead24ee8e0e3b12283b9e376039ef418a4011dad87f4b06459fae4cf4de8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.4/ztmux-v3.7.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5c127d23bfd7cdac9a305cd71030f520edfe07c2765494e460329e5e2844567"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.4/ztmux-v3.7.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ece6b51a7ad7085ddba8494ae6e545e87bbd8eecfa96c32d4660b826ef74abe"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
