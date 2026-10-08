class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-aarch64-apple-darwin.tar.gz"
      sha256 "638c63a4e4b9d435200b50d76141261530709d9a9ef019af758956c4dd0ad1ad"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-x86_64-apple-darwin.tar.gz"
      sha256 "912019c31993becd3603a691a98d3dea654d0258fc12c0e6d8d0654628719192"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34ef3b44c603593798282890dc987d48c0516a609803b179ceb0c76e6ee9dbeb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58168a7060ebbf7ec3fd9b042418f643a5196564b82f6ac1847b621605ffbdff"
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
