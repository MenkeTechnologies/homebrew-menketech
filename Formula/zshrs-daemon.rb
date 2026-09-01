class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-aarch64-apple-darwin.tar.gz"
      sha256 "7f84dbf9e784681c09b4199ef609871e09ab31106b183779f01fa6ea9ab482b7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-x86_64-apple-darwin.tar.gz"
      sha256 "bfd3354c79479f68b3e13bce4e320ed7b7677d0efa7b4a488cff8de5d7922740"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a284cbc0db302e128cf919d45d56ef14e2ef910eab7a79f4f1cc75bfc5466c3f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42ef99b958ca2de2a1b95ad4679fa0cea768db183ce191f9cabb29745f39f8c8"
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
