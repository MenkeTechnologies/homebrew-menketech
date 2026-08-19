class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.40/ztmux-v3.7.40-aarch64-apple-darwin.tar.gz"
      sha256 "15816ff5a71f7813f62e658c7babf5064926addfd80cb95001610194e4283306"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.40/ztmux-v3.7.40-x86_64-apple-darwin.tar.gz"
      sha256 "df7271cbbb225616535658f32bacf1499b6e77d0d57fa1f9117907f3313e2750"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.40/ztmux-v3.7.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af860460de736dc02d91e0fcd102e3dc8cc3c4dbf22ed9f5b0a22814e62bf512"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.40/ztmux-v3.7.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d6480feabc031f8741bf45c1208e00b8a1d18470f3169d7721385ce8d3ba00e"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
