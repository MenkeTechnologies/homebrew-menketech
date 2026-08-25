class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-aarch64-apple-darwin.tar.gz"
      sha256 "8b6a2370e7b8d283ef1ec4c62048d5dfde22602a8f4e279a47361fc58a0a0404"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-x86_64-apple-darwin.tar.gz"
      sha256 "d550f99be6a8080cbaafba656ec2d833d8b32751613994d95cd81a424c2c6a54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14ff31c558d9b26254436096015fe931914bf6a73440ea9913da359a78cf501e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "359b8edcd252bb7244c780110714a24a4a9d2494731c9f56a4eb956eabeafad6"
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
