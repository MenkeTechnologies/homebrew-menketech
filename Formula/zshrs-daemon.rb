class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-all-v0.12.37-aarch64-apple-darwin.tar.gz"
      sha256 "ff12cee120dfd2d36345e5edf5992ad00af686ba3fe7631faca1e58a105e8cd0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-all-v0.12.37-x86_64-apple-darwin.tar.gz"
      sha256 "51ddc84f8e54dac88f98db30b3b782a9268839f9b64e7e775b0a244ae53e26b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-all-v0.12.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b19679dc681599562f1778a011ef37a0d9d7976ea209c44b5ddd8c2c690a3ea6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.37/zshrs-all-v0.12.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dde922b23793b1b19e25eeb8d324b072c30d95d684d39ca4c43868c16036a2fa"
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
