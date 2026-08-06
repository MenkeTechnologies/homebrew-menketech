class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-all-v0.12.31-aarch64-apple-darwin.tar.gz"
      sha256 "a3ca74bee74ef6e05985122f0ead4bc63a29176409896dde25020659b04a21d4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-all-v0.12.31-x86_64-apple-darwin.tar.gz"
      sha256 "9b0760d6755b4b63199547fd3731d704361f71041ca2ed91d908feb55ccef845"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-all-v0.12.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "717c130fac9018d81ba5d125a656ce77a379e8d9899631be7a9bfabd0b7751e6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-all-v0.12.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71128728f9264176f44b86875f6edd905be3443ed3b9f34e5c72eb35a27b0a47"
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
