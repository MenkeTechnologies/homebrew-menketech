class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-aarch64-apple-darwin.tar.gz"
      sha256 "eaac97098e161841e00d55566051ec9b72d5bcc216b2c0d88814bd55f5b76ae7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-x86_64-apple-darwin.tar.gz"
      sha256 "635210dd5db3a63769902ed90c51692dafa1db458ef5676e2842752902f89575"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d38cee05565f2bbd7a01d5eba73150a160e2227e93ae38909e40e696eaa86a0e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06a92a1202e6b935480d097ad4b91c867034e1f1736be31248d031b55c6331db"
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
