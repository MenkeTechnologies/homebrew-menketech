class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-all-v0.13.56-aarch64-apple-darwin.tar.gz"
      sha256 "0222c84e61119088a22bfe7419c2b27fb1a510cf2669070e16988fb43d2d6dfe"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-all-v0.13.56-x86_64-apple-darwin.tar.gz"
      sha256 "4025303e0b8df800125e9098cd25f27b758027b8fa5b36b1733173fb7c93fea8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-all-v0.13.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66bf39c8576c939b6ed5cf7c823b8b7aea1995dc8e482528a666977bf0562a18"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-all-v0.13.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b91f1199042f4e8cf6872aeb185ba0191946523e0585b10add7fd41c1c6216df"
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
