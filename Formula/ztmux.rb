class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.39/ztmux-v3.7.39-aarch64-apple-darwin.tar.gz"
      sha256 "1bd31c52b77dab79fb90739224f4d75a215f5bf637a08ea85ac40718b7222806"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.39/ztmux-v3.7.39-x86_64-apple-darwin.tar.gz"
      sha256 "0e425dfc269f9a5aa7510f202628261d26d34a5dee84c5452a5e289ca7857f84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.39/ztmux-v3.7.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b371259044cf9948cc2a060df79faa3c576b58829d815675ff47c8264ff59025"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.39/ztmux-v3.7.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd230a7bcbcd34caf39082f33f9ca4927c6020de451639e64445d74cdf2165f6"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
