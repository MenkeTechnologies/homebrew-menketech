class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.75"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-aarch64-apple-darwin.tar.gz"
      sha256 "a9de7966e02dd2ee140a7da8ccd11c53cb9397aca3ead5b3232b7030dd487704"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-x86_64-apple-darwin.tar.gz"
      sha256 "251998c1f6183fdb286096d6e126a861cc67ad932122a4179c49da5473655ecd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43260988ac63b119737caff3a6d5e6eeaf75b69bd9eb0d07072c1f03ca8d5861"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "863d763e7c4703b1081cc99ba44c3a33da7f237d9f008216087b07c2177422cc"
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
