class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.13"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.13/ztmux-v3.7.13-aarch64-apple-darwin.tar.gz"
      sha256 "00efb69bfae8ec3aabafcd43b686a187ec7452f2a45e8165ed103481eb282555"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.13/ztmux-v3.7.13-x86_64-apple-darwin.tar.gz"
      sha256 "2bcd65331f4fd8256f8f15504c704b4cab68b8abaee607ca043a9ca88a924ed5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.13/ztmux-v3.7.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6067a7c85319cc0782e73b9649b8fd561b98f3f50b394a1485640e6ea2a0c219"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.13/ztmux-v3.7.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea15238fa0bcb1c28cd90c66ce0c7d8745f133eb87a35559944de4736b25fbdc"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
