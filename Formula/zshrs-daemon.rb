class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-all-v0.12.25-aarch64-apple-darwin.tar.gz"
      sha256 "b9d13909503d3cbd203dd4360ee6f58e988e6cb2af81cb0d00974113a7bdf9e2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-all-v0.12.25-x86_64-apple-darwin.tar.gz"
      sha256 "713c53801a30eaf1c13b11390da4aaa29b49fb19f537e97ca4ec1a73c70e71df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-all-v0.12.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4101ad6a81277ff195e42878203ef9f12022e06a6c5611421ce98a22f912a2e7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.25/zshrs-all-v0.12.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a3d97369d5961a6ab43c08155c68b2862a0f3dc244b965d39ba2a704a0a59ac"
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
