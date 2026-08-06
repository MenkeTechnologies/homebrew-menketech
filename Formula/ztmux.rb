class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.36/ztmux-v3.7.36-aarch64-apple-darwin.tar.gz"
      sha256 "78c6576599841483dd59ca20da3dd0e47acf52d204ea7d120e507c80b80e343c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.36/ztmux-v3.7.36-x86_64-apple-darwin.tar.gz"
      sha256 "73c6e7aabb562e8cddbcfb8f8f3037443419fee9fad642db4c33e52763ad14ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.36/ztmux-v3.7.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7df8d87f1d8ea6e4276d9db615393f9303ff27a332caa132306678dac1064cc3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.36/ztmux-v3.7.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8a7cad6ccc1f813d42b5f911555419413b2e7d7f5f8a9d665e168511cf5db2b"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
