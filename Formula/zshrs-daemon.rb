class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-all-v0.12.15-aarch64-apple-darwin.tar.gz"
      sha256 "f3b89199a6b9360e6ee64cdc580223057f574f6ff9ce3484e2a62ad325114c4b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-all-v0.12.15-x86_64-apple-darwin.tar.gz"
      sha256 "f3467afe35419c787ed3def48ad00a5d1573249fe1cf55f584cc80c450dcd241"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-all-v0.12.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19652d75c12813e36efe306abd6e29c161d9db74b84c162d04039c328d899fbb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-all-v0.12.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c90d4ee5fdc5efcbcd3e079eb889a4834b43c1a03ae60bd850814100983ac23"
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
