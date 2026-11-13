class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.71"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-all-v0.13.71-aarch64-apple-darwin.tar.gz"
      sha256 "0561498ebeab48eaad1222e547b7f37ccb2c16bd23ba16734984cf1e04f730ce"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-all-v0.13.71-x86_64-apple-darwin.tar.gz"
      sha256 "b3c1b3da66fedd8c2c231a17e7c646d58c37d0dbde2ccd4a7fb3d9b34c170bb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-all-v0.13.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "262aa1c29e338bb35e0272a2c2ab2ca1e25d93c4ccf6ac1d56e1d90fbd919777"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.71/zshrs-all-v0.13.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd204e54464453bd9bb849a898a6b153e04c244543c76bcb76f7681f756f340f"
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
