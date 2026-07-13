class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-all-v0.12.11-aarch64-apple-darwin.tar.gz"
      sha256 "8614c844e83331c393f5175c7977806cd916dec57da3cd8547c2dff6dd523a80"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-all-v0.12.11-x86_64-apple-darwin.tar.gz"
      sha256 "898bceb50c933f468164257d7108039e71501caf6cda4c079e264fc201baedde"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-all-v0.12.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5351316543d44a655b142de0b9351f50e9c6ec54e4b93a53581b976180af75b0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.11/zshrs-all-v0.12.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60c81e06c1f8a952c785cbb1155e84cab5ec1eb2f41265365a39498ea2c7e561"
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
