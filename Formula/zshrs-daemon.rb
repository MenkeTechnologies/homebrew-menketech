class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.67"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-aarch64-apple-darwin.tar.gz"
      sha256 "bf663afd979ebe5aeb886698ef641724fab4ec1a7a8d1da2c2c6042a7a5b7864"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-x86_64-apple-darwin.tar.gz"
      sha256 "5bc7f650da8f8443dcd303b62ab0450ee97fa6e967e6e735e3c471526f26cc4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4207ca7ff333c3bc9e9c2dd09cf9ed79d2f0386e72c250944bb5c8b686b65856"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-all-v0.12.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23934866128661872bb9ab250322195b926a6d7c2ffa9bb4e915580f45b9c433"
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
