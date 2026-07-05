class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-all-v0.12.7-aarch64-apple-darwin.tar.gz"
      sha256 "e204ec98beb42bd1dc449415bfb2d02ad6d3662bf2d7e3608160f6e9b975e9a8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-all-v0.12.7-x86_64-apple-darwin.tar.gz"
      sha256 "ce98947f4bb7dd9e8b0ca0941d9ff56ca1994edf31604988c2bf76a509599e71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-all-v0.12.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "668e1dcf62f9f92e0c0ccbf86945039c4930892657610ec30b2de0bcd9af674c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.7/zshrs-all-v0.12.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d12a5d00dc9d4fcf011b072307945ab5e3f3237746e249874063069145059155"
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
