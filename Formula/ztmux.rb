class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.9"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.9/ztmux-v3.7.9-aarch64-apple-darwin.tar.gz"
      sha256 "35af2aa637fd815a7c2352f164b857b5fd575befd6d057fa5298cf755f9f47be"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.9/ztmux-v3.7.9-x86_64-apple-darwin.tar.gz"
      sha256 "80e2d7bbac5b55996939229a0a33973ee32a0ad60f49ef3b4159041cb0ec5873"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.9/ztmux-v3.7.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d74854554b9d187d173b7e1f700a76c63cce8ce2dbee828be441049b0c01cbf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.9/ztmux-v3.7.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c1db8a407deb7f432f702142f95899fd4152da2c5e7e78b12de8f3fc73d36ce"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
