class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-all-v0.13.47-aarch64-apple-darwin.tar.gz"
      sha256 "1dd839395ed6c4874769e3f1da340d59ba601e4af5c7b1593ddcdd75c002cf51"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-all-v0.13.47-x86_64-apple-darwin.tar.gz"
      sha256 "34364f78784198a1d3023493bc8b4080097ead4a32e202a55f8a17756d3730a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-all-v0.13.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af569f3a7b77436102656722240a28ab27c370d377ef0ca5495da9c323e5f897"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.47/zshrs-all-v0.13.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9851147361f5f86dc2320bbe9218f36d7e0e411041bfffa9cfd365918715967a"
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
