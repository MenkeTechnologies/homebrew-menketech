class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.65"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-all-v0.13.65-aarch64-apple-darwin.tar.gz"
      sha256 "543d0b1c700938b76f2dcd5a9eeb2c7eeee133696b83b8a9402a2b48f4d5551e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-all-v0.13.65-x86_64-apple-darwin.tar.gz"
      sha256 "ab35a4b1a073b0c123014e862c394418d51f64906a3baf5df6444809dc214cc3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-all-v0.13.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "304f8c4f33b7540aade0dc73545d1771d551c19ab262f815265a9fb796830b61"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-all-v0.13.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23a077f475b32915b28a9e3745b2789470bb642359695be11433b0c9b9839cd3"
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
