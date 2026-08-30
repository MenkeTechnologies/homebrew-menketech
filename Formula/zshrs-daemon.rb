class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-aarch64-apple-darwin.tar.gz"
      sha256 "78cf65850b5c3a23522eb4e8808ee573ecd29ce709c4be6595979cf7d034aa33"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-x86_64-apple-darwin.tar.gz"
      sha256 "bf2950191aa4c4fea9e86125dc404696479dc1a27da028ddd4c5fba67e259492"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "511119341720b708dc1e2b160f235386a1acbd2eef9e791a5b86ee459e0672c7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58ce8c5a4b8f8f6a9fb1ba7e1dbde35677da05cf19bc67be4c97456dd036f9c2"
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
