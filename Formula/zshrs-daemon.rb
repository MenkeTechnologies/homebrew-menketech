class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-aarch64-apple-darwin.tar.gz"
      sha256 "69646c49ac5dffd0644529c1ea7a454a50b4ff70cf9424ef7b560c21e607844b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-x86_64-apple-darwin.tar.gz"
      sha256 "3204e3dce9c2aba3b05882c9644927bc8788e197aff1620b4513f3cd5cc31a85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fca254370998485c88458ea03b1d9ea47792946df499810f58ac07abbbe502ff"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3f217a06c386a8c069cbf9e3a876e9172108f759f2defe99f7e91764f7b0253"
    end
  end

  def install
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
