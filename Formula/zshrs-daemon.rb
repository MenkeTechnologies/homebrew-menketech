class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-aarch64-apple-darwin.tar.gz"
      sha256 "396c595764f4d90853174389066c4540be2521c0cea46225b8fe490ae0519b30"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-x86_64-apple-darwin.tar.gz"
      sha256 "2f3f11d7cf4d15bf39be57baec4cf603fed526e7b5b301d123e5137393cc9fb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51410c8395948e14fda10f253abc41087886e8aae59c40322689d0b936511108"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e4c0b2e776666b01382388439f76a00aea2836d3f4d500729db05e9770f9f95"
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
