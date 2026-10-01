class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.69"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-all-v0.12.69-aarch64-apple-darwin.tar.gz"
      sha256 "c8fede751f621c3640691ace416282fa200c1c41906af4b90535e658905f44e3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-all-v0.12.69-x86_64-apple-darwin.tar.gz"
      sha256 "1a435c80fdaf29e45c919c04dd9465e289cca49e2dce62ea25dd4d51a9c1a8cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-all-v0.12.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aacc9ffeb581a04f9106d5411e952e882e3b0b39d23ed06033957e352247d177"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.69/zshrs-all-v0.12.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ef6e5413322fa6ec532ed1796ff6b18f695c526f57e3a0a43a8d9f2d36092c"
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
