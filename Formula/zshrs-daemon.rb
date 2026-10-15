class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-aarch64-apple-darwin.tar.gz"
      sha256 "6d2f34f4644a58dca5cf750a5272ec7d72a971ca80dec7998f24e7e812b89dc4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-x86_64-apple-darwin.tar.gz"
      sha256 "5db870c9bf063e05c1de6eded1a38713b3d0e391dfe6fe8a540f064c8bbf7b96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10b5a192f0220a08117b04265e8855cf354fd5e288c37afd3884934a1b9689f3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1028a1e9afa10fb4e32c2472dabb39a5bb511c88895d0ce346f654d7aa6adc0b"
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
