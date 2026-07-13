class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.19"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.19/ztmux-v3.7.19-aarch64-apple-darwin.tar.gz"
      sha256 "05a12b3592e66eb0e3a2cbd1255b92a6718f6a7752783f454288356cea979b9d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.19/ztmux-v3.7.19-x86_64-apple-darwin.tar.gz"
      sha256 "cac45f5ae2c66d55d3d57fd809a5aac44a733a621337470e22c96618de4e6861"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.19/ztmux-v3.7.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c6f9cb99b24f9b40ead860ddf7cbac932834bc87ccab4935eb4c9d4214b6b76"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.19/ztmux-v3.7.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6afdb0977b0e10a218f4df2205ac872758dc0892ddedccb9dba56e7f55962e4f"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
