class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-aarch64-apple-darwin.tar.gz"
      sha256 "50788bbfc53988dddf3fd43a05bee2fae35defa3c7a7e526dd2d79df7e6f4610"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-x86_64-apple-darwin.tar.gz"
      sha256 "3fdef013801b32c21fadd2899059c51dd7a86d99aec5ddff1049c18976bcdd61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19c63a6c825aba9ff623d02f5e4b03315280316ce44d8495e5df01325e6eb984"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.60/zshrs-all-v0.13.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60b4834817c7984b6c280296079d6d4ed4e68147ff44de3405eca85eb3707527"
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
