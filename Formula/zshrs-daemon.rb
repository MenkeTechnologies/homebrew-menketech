class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.64"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-aarch64-apple-darwin.tar.gz"
      sha256 "5434daeffbe74b93cb5f061a501c38c76856366fa26f0ed03bb7ff15c922b59f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-x86_64-apple-darwin.tar.gz"
      sha256 "ccee19e181c4fb5f55dfffd558079e1ee76f5f5d3b1714d200e34ae7216a45c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1746a0a421a074c8fa332dca1e755d73fe5d162f32411ceafc3647e2dd69b1e6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be3e47fbe263fae679a91870e55386ab8f8f99dcb1b39a8f8fe22426b94a8d74"
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
