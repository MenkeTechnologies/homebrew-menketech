class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.21"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.21/ztmux-v3.7.21-aarch64-apple-darwin.tar.gz"
      sha256 "6bc16dbc741d225482235143fd1063e2feeb2b6af2e002121afa401881edbba3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.21/ztmux-v3.7.21-x86_64-apple-darwin.tar.gz"
      sha256 "1113a6a153881213f0645874f127e25be70b0756ea026336ea42857207ad71fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.21/ztmux-v3.7.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40fc2483790f459e78b396d66cea627817ae13f170035541676cfa55f679b21f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.21/ztmux-v3.7.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e098a634f97b11306efe3cb2b83710aa326317339c848ca28f3e18687a33eb9d"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
