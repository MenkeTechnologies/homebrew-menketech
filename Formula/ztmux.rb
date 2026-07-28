class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.27"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.27/ztmux-v3.7.27-aarch64-apple-darwin.tar.gz"
      sha256 "191f85e869436dcf9de5a9adfdedce4a75cbe9dc7507bad9991604bd13e11373"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.27/ztmux-v3.7.27-x86_64-apple-darwin.tar.gz"
      sha256 "fe8a235285fc9dd1f09844789c54c18ba5c949870b11b4b474a706f48d35d153"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.27/ztmux-v3.7.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c2d4ca62cb382f3c89aaf8d5592a1f150ffde32dc9b0bbf7d74371993b5e719"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.27/ztmux-v3.7.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1351c1cea07a5746c15cffe9a0f3869cd4767d987db8e7721e1199d1d8b96479"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
