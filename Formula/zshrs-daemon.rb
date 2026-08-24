class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-all-v0.12.38-aarch64-apple-darwin.tar.gz"
      sha256 "31dc70dd775f841c7ca15fa911d691a7ea31b320cea321809908e57c407db7af"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-all-v0.12.38-x86_64-apple-darwin.tar.gz"
      sha256 "20eb72b6441294658cd1d2b26b870a38447b6ad0365050fd8e8cc0847b58b859"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-all-v0.12.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "074d4d43efbc275c900fc930a0a59ff8f12296dc1f3c1bad3067bc1150922a2c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.38/zshrs-all-v0.12.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f648834ebb581af2aa3574b63445c9be1bd47c54eca40669b11b639889c0f18"
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
