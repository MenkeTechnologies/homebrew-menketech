class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-aarch64-apple-darwin.tar.gz"
      sha256 "9b8e6d3346962581a40fd601bdea9438863275ad2eeb389b8a15f41381de3332"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-x86_64-apple-darwin.tar.gz"
      sha256 "dcd798f43a6d6200bcd12ce20a9f178d9b533672eb3dc22f9cf69c8bce9aa81a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b4237e27306ecb3db25bd4b502531aaa0381ee1f01f4250ec792c3f43b388d5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.4/zshrs-all-v0.13.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "958d71f490bda8095717505eb92e9b8102241366eb09fc928737a50b64e2ba10"
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
