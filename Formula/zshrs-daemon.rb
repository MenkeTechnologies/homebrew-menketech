class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-aarch64-apple-darwin.tar.gz"
      sha256 "0a2d3bae9aaf47c41c7a87c8aa9c36527940ecb3ffbce49583bf141b75b6acf0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-x86_64-apple-darwin.tar.gz"
      sha256 "ad42f07218cf5c690141f2d09c7a67c2f6b6fb3a89111b341ee3ac47b12bd148"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53f8c93254537d48e727641578bdaeda9bbf0f6da42b84bb1f6dec010e0f3ea4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc470086bf3a933396d5f33d797c0cb77a4144a6435ba3d4b9e8535d2e88c07d"
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
