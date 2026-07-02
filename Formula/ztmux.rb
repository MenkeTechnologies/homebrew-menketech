class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.2"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.2/ztmux-v3.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "a82c02c8ed740666161463d83b9d90e99654bf009f49f317f43f0e49d3c8358f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.2/ztmux-v3.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "7ad36b0ab543ba8487d38e142ceb1a2c2953c65cf20899670b39f0e9def4e19d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.2/ztmux-v3.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f41e3ca64c8ae13e6287f1de8d52a26df1731f70bf8b1f141ad8401d168f8b5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.2/ztmux-v3.7.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5395f91f91c04294e457b98b9f0e9a7931711b53652f64e4b36058b1e9527401"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
