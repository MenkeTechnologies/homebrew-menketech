class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.82"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-aarch64-apple-darwin.tar.gz"
      sha256 "033a4a71c5a1f78601be596a078f74cf4b88f942c500dbabfb57a67dc1b5f8ae"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-x86_64-apple-darwin.tar.gz"
      sha256 "45c3ba477a9d24c6983550df00d314cdc1f11f3797fde0db435dc1c288117d8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0e11f5ec1fdc24e313ffda025334ade770a16879eba7f0c30a431b8390d05fe"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a6ac8d25714391fb31ad030bad0ea7d9904e3f016c4924abe3502e6782a4efc"
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
