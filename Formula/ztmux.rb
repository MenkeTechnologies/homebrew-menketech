class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.28"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.28/ztmux-v3.7.28-aarch64-apple-darwin.tar.gz"
      sha256 "b418ca0ddb4946cc0a2595c330d7a0d5f99dcd5fc08c23bdbe181380f4811d17"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.28/ztmux-v3.7.28-x86_64-apple-darwin.tar.gz"
      sha256 "de94720d1c5868424fe653de12a4244b7a418ad4604868ec5149c7ff027c2d8a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.28/ztmux-v3.7.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5b284f842e99e81adeccda6106130b29a8b41594a1349a4c006265ea1994732"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.28/ztmux-v3.7.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "166add5a50aba8e3ac7a3228dd6c0d55bd6b59b00ade4ce30adbb86418053a01"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
