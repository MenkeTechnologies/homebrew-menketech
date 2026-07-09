class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.12"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.12/ztmux-v3.7.12-aarch64-apple-darwin.tar.gz"
      sha256 "f3625801fa35e60766945f71468be545a616119086199d58964f3e8ba2f4be0d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.12/ztmux-v3.7.12-x86_64-apple-darwin.tar.gz"
      sha256 "282984a69ca277b782b16845278060fa6b99a0466c309183240ca2c3a4c00a30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.12/ztmux-v3.7.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28d2423169f23698f2980e35e37b454dc27e323a27f432e751007c9b3e67b24e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.12/ztmux-v3.7.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "161b7c722ad975a11aa46612c49304dbf552e30072ecb8458f500748cd195fac"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
