class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.43/ztmux-v3.7.43-aarch64-apple-darwin.tar.gz"
      sha256 "825ae73e101834cc0a26ea2dab9098b8c55db22cdc1ac77caa0d5bb06a26478c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.43/ztmux-v3.7.43-x86_64-apple-darwin.tar.gz"
      sha256 "8bde8fa8b22c06b89a75ef17e2d3474ff63da649495c5eb6e256bea1fd8a5bb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.43/ztmux-v3.7.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa4592ed42c789991b67b1c5195f1dea91e06326fbc162712b5e3aab49258316"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.43/ztmux-v3.7.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49ab28c38ff05b76ded4297ecb37ee2afc0e1f11f5f47675cc9b0126643beccd"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
