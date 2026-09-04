class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.58"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-aarch64-apple-darwin.tar.gz"
      sha256 "6c3ec9e3929fb69497274da0e62191503a8990659e6ee255e48a57232a3fb9d7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-x86_64-apple-darwin.tar.gz"
      sha256 "41a4ca5754786ad1b3a5e84101c682dec65e35cf4a5548fa4f593e062757229f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6fd4c3e7261e7853c8a3cf5039c7798c88f10bb321685777d5ec9c31fbd2eae"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-all-v0.12.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "362d7b413d19008ad57837965ca9086e73c0d9ace742a00100b0f391d951f753"
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
