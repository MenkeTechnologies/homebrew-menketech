class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-all-v0.13.20-aarch64-apple-darwin.tar.gz"
      sha256 "6e96791578d6802686160b69c2206c29997affa5fd9d112e15570c12c13ee6f4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-all-v0.13.20-x86_64-apple-darwin.tar.gz"
      sha256 "e42a87c1715e00bd8673652f952b05625d7379d889afe53315c363c73b3b1f15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-all-v0.13.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e33f1484a9fcca503118e4be17ada4a89805ef33a306fbd4d5669f633539a93d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-all-v0.13.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd29ea0314da14cb6d9066954af0f122f8258f7640550ae3510d4137e951795c"
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
