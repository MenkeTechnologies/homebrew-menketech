class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-all-v0.12.33-aarch64-apple-darwin.tar.gz"
      sha256 "584fb1d147af5b991fcf57d96d97af385204ca4d4e613095b7fed1e6fb24b202"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-all-v0.12.33-x86_64-apple-darwin.tar.gz"
      sha256 "3ea8ae806a2cd52230f1964842e598d01eec250ae2e32df92fde97a6a7a1d197"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-all-v0.12.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a82f45dbd5acd55a6eee977639e34b1b65693499e27a09898e54b733f2ddcf7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-all-v0.12.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7b494e33a63a3be80532705b8a92b38e70a5374336069d548a448b211b5701c"
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
