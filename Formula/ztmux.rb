class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.49/ztmux-v3.7.49-aarch64-apple-darwin.tar.gz"
      sha256 "f5338022b9dcb43eee930fb6e0d3cce1152432869c05eb8aa8571bb0d777aa04"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.49/ztmux-v3.7.49-x86_64-apple-darwin.tar.gz"
      sha256 "3bd0b213fef52e98980961aa3e8a6e86bf0cd47302d24b9d0a8fc2126007a7c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.49/ztmux-v3.7.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35b75c59a94520e27fd9dba55121003c778642889413622a4215f3933d6c97a5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.49/ztmux-v3.7.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "144acd720180ad1c7897f30da368217295f0d2e02cc7338c940ae4ea3dc412cf"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
