class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.50"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-aarch64-apple-darwin.tar.gz"
      sha256 "a2c460d1b83ba2d8b07f1cc57f1571c90993a30ba579fd2ec4bd43f1b5633ded"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-x86_64-apple-darwin.tar.gz"
      sha256 "8485f96ffdffdde095ac839fe063d334e5fc6489915593fb79564bf3395cba45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d086b6dfcb7de8121e65ab454e8305c7ac60900f5f8e08e030f3981a10fc228b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83778a6c3f9d1d711750e8eec84650a78528ee01311785373174a58d7776fe11"
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
