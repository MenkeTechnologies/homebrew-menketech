class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.63"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-aarch64-apple-darwin.tar.gz"
      sha256 "eb2e3a89062511b404a6825eb87a11351f633b4c27b1d8f6a91f240464abf03e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-x86_64-apple-darwin.tar.gz"
      sha256 "18964120e70051a0f56796169c6740a4f95e0d7482277d1076cc77d635d8552a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8326a52cc764c2f34e93bc5b5b4e52514a4bcc3a73a418b92fb12d19b4ff250"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fc06e6b906e3b57cfe94afd8fb37ac978389627cd5dc551961a30111eadff1c"
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
