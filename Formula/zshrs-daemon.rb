class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "80c7166c3b9b8a3858ee3143be1db50c6f1f970a1c032dba1d85a63b023cccfc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "1e366b48220b1897fda55a0f9ab54b2366a1a09ce76f438977f3b851c42b620e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8788d06ae43b120dab40aa9e5c5b896aed4387825ca9e709964cc59ea68bc976"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02e31ec2c4ab3faee017c678369d74b89e496abdcfb34b77b0f9cb8d1cdda0eb"
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
