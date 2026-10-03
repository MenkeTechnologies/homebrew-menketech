class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "fb12f047a2ca45e2fce7d71f21ae9e8160aeece69a92fac83dc11f2c786c20b4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "db750c448c88c77de5b86c6943023dc9cd8b10d9d87d6b171c992a0691ebfad5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af6e8998538e517a1e2352016ff316534f0adba81d3f5107cce52c461bf378f0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35eb567fedfbfe60940d17e1733582e900aea39f879bbd4634b52a42dab46411"
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
