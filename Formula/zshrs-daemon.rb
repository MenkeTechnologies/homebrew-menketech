class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-all-v0.12.23-aarch64-apple-darwin.tar.gz"
      sha256 "ab9d5893802ac608a872976bb12cba227e9c5554ac19a4009a2721e01e659e8d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-all-v0.12.23-x86_64-apple-darwin.tar.gz"
      sha256 "bf859006ec51e28c80d4aacb90c7cc738cf939b99c37ae2f23824f91758baa50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-all-v0.12.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f45e1d174b77756c7088d768f035e847b4b130808f4f04c18c5781f3873e333c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-all-v0.12.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc03c1277af47872e1a978890345b865d336edcd8a74a1cb419bcde227cf73c0"
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
