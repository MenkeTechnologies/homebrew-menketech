class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.45/ztmux-v3.7.45-aarch64-apple-darwin.tar.gz"
      sha256 "5594416889dc4e2d60dcccb99a1297b7312bbcc47ff964ef4842557bcfe06ebd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.45/ztmux-v3.7.45-x86_64-apple-darwin.tar.gz"
      sha256 "c66828e4f4d9e355d71c7ab3efb6afc3baa514e6578aac3cf984f46b920595c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.45/ztmux-v3.7.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9da548a82c534f2e0b6a736e56fc11809165f46a664e01745e612dfa71aab084"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.45/ztmux-v3.7.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e854c7dc21c2495db37fce7dfe24f0bdefb57ce7f768e83cd8f7958209db506"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
