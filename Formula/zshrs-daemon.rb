class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-all-v0.12.18-aarch64-apple-darwin.tar.gz"
      sha256 "ca3d00236082b2fa9df1f0eebc629ef726c0f9f68114714f7439e3d7d7d57cbb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-all-v0.12.18-x86_64-apple-darwin.tar.gz"
      sha256 "bde553cbc62c52380283e27dc79eb69e703bddc5cfe4ccefd5ae41e810cbc96b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-all-v0.12.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31231a63b6196eeeab14f67dd9d7d751a9beef08a8681fb922aa47f84cea7ce5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-all-v0.12.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "902ee1bd4e7d512fb0b730dcea0a2a082de006594ec9eb4e79bf6dbed17a7c66"
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
