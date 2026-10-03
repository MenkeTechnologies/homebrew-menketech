class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-all-v0.13.5-aarch64-apple-darwin.tar.gz"
      sha256 "6043c53ac1749d683cd0712a7a95af9d97aee4b76e498d66b84c957617ce9fbc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-all-v0.13.5-x86_64-apple-darwin.tar.gz"
      sha256 "a5a4fea57f0743b65417c814177b30c3a8723afe1ecd95eb34dcfea946df7fbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-all-v0.13.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4684802a12b0f1394afb1d9d007edf5fa5af04b34f204c9f6e64842e35f216c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.5/zshrs-all-v0.13.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20913b1097709970acbb8d8624ba80e655c54f400292f23a3e379f207e22d783"
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
