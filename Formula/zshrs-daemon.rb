class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-all-v0.12.26-aarch64-apple-darwin.tar.gz"
      sha256 "f26ce9ebccb750212ed31ca555b54259d5d9b2243664a3a75e0c9ab5466bd016"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-all-v0.12.26-x86_64-apple-darwin.tar.gz"
      sha256 "8d352f81fcde78d6835cd0f3edd1220a196d75b8847db7d0cd8b8a977e6fa7db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-all-v0.12.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a29e4a90408783673a29cf70abbf28cf2dc15fb2efea067a2c0bfd8d4c2b72e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-all-v0.12.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4823f68ddfd859337242eb025213c0217c829dbef484871c65b7503b1ef2629"
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
