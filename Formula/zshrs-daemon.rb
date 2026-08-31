class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-aarch64-apple-darwin.tar.gz"
      sha256 "a098e1fa48934c331edabdd10a47ca1a666ca4ef8a7d83e1efd1e915953dae7b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-x86_64-apple-darwin.tar.gz"
      sha256 "dd22e8bf53d7a97782d1515adad3f46fa4cc5c18b34570d647b6864ebfa8d418"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70f11609450263dffc0767f7012c609a10735ab6067a5c68796d2255003864b5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb42ad4d1b36b952197d2bcc7f87929f90b5eced6e5fd78db0ad92a245750bb9"
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
