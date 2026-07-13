class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.15"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.15/ztmux-v3.7.15-aarch64-apple-darwin.tar.gz"
      sha256 "6c7ec6eed0525fac37256239cc64eabea84fe8a068413735501f52896796e46c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.15/ztmux-v3.7.15-x86_64-apple-darwin.tar.gz"
      sha256 "9c81280704a84c8f94bc94d63a4409ec918ad29d487a7a8705e43a51844ed294"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.15/ztmux-v3.7.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42edca313d1f99d420e3440fb21ad9f2a62e3edf63c495a550518fe0189eecad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.15/ztmux-v3.7.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7a94e5dda21d3a327e6b9c0781eef7b9a72f23040aaa5747b57fdde9786cf94"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
