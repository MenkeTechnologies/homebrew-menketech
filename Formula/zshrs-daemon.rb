class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.68"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-all-v0.13.68-aarch64-apple-darwin.tar.gz"
      sha256 "83bc976d31b793c4c0a9a09fb0260f20a11d4192bf4e698beb253c29110ece02"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-all-v0.13.68-x86_64-apple-darwin.tar.gz"
      sha256 "b1408a7db70a5b25c4d36df35a5519dcdf3798569464b7541c3f12fa755b87f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-all-v0.13.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16b3e75a843636825d511f5564fb88b758c77d34d6ec6714918e46f073d7478d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.68/zshrs-all-v0.13.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "435be0c1304a927bc8c20e3ca906e72b2186de0ead5d4e56e710651cc90e20c5"
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
