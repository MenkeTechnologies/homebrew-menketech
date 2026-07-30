class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.34/ztmux-v3.7.34-aarch64-apple-darwin.tar.gz"
      sha256 "1701d70e5bad9d49ada7275f850a4a25a7c8e4a3fd1bb18288723aac022be078"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.34/ztmux-v3.7.34-x86_64-apple-darwin.tar.gz"
      sha256 "0f4f49606346d533b75b99fb4163579f6fbff3be7551b448aa07ef5f26f28ead"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.34/ztmux-v3.7.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abd35b18e9c198a9cea12cb8de5b179d15653000889a4d12eec31b857d5c88ea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.34/ztmux-v3.7.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cfb97e039874eed67217d94cb2af43ddcd146ee8dd8fc8849811acb36ff3e76d"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
