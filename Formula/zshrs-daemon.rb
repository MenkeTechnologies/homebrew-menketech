class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-aarch64-apple-darwin.tar.gz"
      sha256 "f71b34d075150d1c503ca3c2c45814bb35e76db1eddc956e9dfab02e25e63aee"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-x86_64-apple-darwin.tar.gz"
      sha256 "dc98552d84f9436b788ffb99e46deddb55bec0e9a015cd91d2544d2b204fd5db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7771a1e629f7023a4070269c2a608cb0c81cfe97f13fda0a0dcb35a60b3ae619"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe7d7245ca8ac2bd1e57ddbd1a9a8d058448fc1cab6a295c96aa322fed4d9893"
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
