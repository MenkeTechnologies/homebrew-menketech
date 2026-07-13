class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.20"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.20/ztmux-v3.7.20-aarch64-apple-darwin.tar.gz"
      sha256 "d45a7507ea76034901d46e8ffe0fb2bd24ba261f613db2f21376b2b386b57634"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.20/ztmux-v3.7.20-x86_64-apple-darwin.tar.gz"
      sha256 "524bc3b949238742c551780ff7fa1b7fa291a545417ee95e96fee2d9caba0f72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.20/ztmux-v3.7.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a7b2c3ac9838bef4346481596711e28f3f9d378e0d556aadc1f76de9738cab0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.20/ztmux-v3.7.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2cc1e483edea8d7cb7d04351eae781c597139a70a7eb9a840e50c3e062478228"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
