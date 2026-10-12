class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-all-v0.13.34-aarch64-apple-darwin.tar.gz"
      sha256 "2bd1b25754b4987f66dd86249e5cd547d4769ac11d840bf5cb6fba155be8e76f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-all-v0.13.34-x86_64-apple-darwin.tar.gz"
      sha256 "acfe357dc1ddb374e19f1e70a5fc3d799982b3dbb379b9398fbf0dc0ce6f3e63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-all-v0.13.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ecd6f5af38a4c03696c578567d4e730f00208a0f572990dc883c0f58eb8960c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-all-v0.13.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59bac25a4ac2f136863f36e1711023e1e222914d2e13bdda47c7d6a4f5bf5134"
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
