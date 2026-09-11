class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.61"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-all-v0.12.61-aarch64-apple-darwin.tar.gz"
      sha256 "8ba978791bc1c08a356db6c22d4fb62d48fcef06bbdf6f13bd9efdb4da80b1a3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-all-v0.12.61-x86_64-apple-darwin.tar.gz"
      sha256 "ba2bb03caa4d92c7c943a2c23dcd998c13a893807f5f09ae2c29b234dab9106a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-all-v0.12.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "092e8a25af58a44b0395304d92d6fc315a4adb908834bd88b61467132fae3d3e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-all-v0.12.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59964428f839457bbd3ca94e5cc166ca6acc5dc6044195a0d07a948ef8c40217"
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
