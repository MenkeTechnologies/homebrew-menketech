class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-all-v0.12.20-aarch64-apple-darwin.tar.gz"
      sha256 "869d825992be19307d24274012c0e10daadffee1ef491ac6f7fcc4f4f197c2ed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-all-v0.12.20-x86_64-apple-darwin.tar.gz"
      sha256 "2eb38f500a1cfa6507ac5f8d0bc23f71ee40c894ab1eb32cda893fb28f3e70c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-all-v0.12.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5566cf1eca19fdf797135eb63f9edf31dfb1448d21856664237d0aa6bfaf9d9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-all-v0.12.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48fbfd747d3a0e66b2037c5fe0d9127908b2a5d3ad739e97ef0ec5e4f7808cff"
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
