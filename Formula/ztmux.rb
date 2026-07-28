class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.23"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.23/ztmux-v3.7.23-aarch64-apple-darwin.tar.gz"
      sha256 "c51e0bdeb44e3a51d63c884d2411c807d039475031b57e4c63e79bf48c845e51"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.23/ztmux-v3.7.23-x86_64-apple-darwin.tar.gz"
      sha256 "8edcee5a689a1821b02985e3718b6af42eb27752a02ab6c5ccb9462410da6156"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.23/ztmux-v3.7.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "329d93201beaf5129a03ef44ef9ca75969bbace9b93f58a9ff5c61a172c571d6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.23/ztmux-v3.7.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35791b919f68b26f65567a2fe6d97fc92949b64d14d009de26ee39d6c84b87f9"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
