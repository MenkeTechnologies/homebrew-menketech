class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-aarch64-apple-darwin.tar.gz"
      sha256 "5f2e1e66e566839489415dd2669a1dda1ec310a15b62b54406a713632ba076e4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-x86_64-apple-darwin.tar.gz"
      sha256 "33c2f77ea509b3cf530e3b97b9096d7e05ad5988ad5a4cf58bd17e66bb14b8d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ad76cc79fb67d6e92b84761f178a9a3e670896f14828d86df80087fa5cdff65"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fbc53514c53e7e6d722a9e72e22051d33f675e725be0e9769877ec9246b00d8e"
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
