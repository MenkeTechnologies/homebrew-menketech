class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.42/ztmux-v3.7.42-aarch64-apple-darwin.tar.gz"
      sha256 "43f88f59155863b810199f1fa89d89f79c916266442d755aabd8fc15d02ff777"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.42/ztmux-v3.7.42-x86_64-apple-darwin.tar.gz"
      sha256 "6c0f2113424cd82b798894eaf26868505d9d72e4cb3e3ed6d0eca5eeedc47ea8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.42/ztmux-v3.7.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6af46dba322f09873a89be03210d3e9e536789d949fdbabe977cd4adb424d086"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.42/ztmux-v3.7.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0d6bfbd2d9eef5203b856c4e816e2e25925465ea76e21747e872f17fc326216"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
