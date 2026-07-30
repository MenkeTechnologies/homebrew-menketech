class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.35/ztmux-v3.7.35-aarch64-apple-darwin.tar.gz"
      sha256 "15f908b8cafa7149bde2cfc0cfe4262770086bbc45005b4fc19e79100b585df2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.35/ztmux-v3.7.35-x86_64-apple-darwin.tar.gz"
      sha256 "6a22b98a70e2cae3b8f9cf2c207e6d597c22cc6da27be017cd2c2b72c232ad7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.35/ztmux-v3.7.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a483c5064f07cb151caaf67d56a1c6fa3797072b02e5e4de24c1a23ffe55cc8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.35/ztmux-v3.7.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04566d584f8254842682ca1c59cb765f81cbdef65786e572782fd366abdaf3fb"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
