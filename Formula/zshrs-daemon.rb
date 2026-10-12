class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-all-v0.13.39-aarch64-apple-darwin.tar.gz"
      sha256 "fd9acf95472b7017fab7136c10133eb2043457738f4729b4e339d6e44be78d37"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-all-v0.13.39-x86_64-apple-darwin.tar.gz"
      sha256 "ad06e7c61b1197fdea086b5d6942ca2a52a4f8703e16d8022ad377cf72f5b60f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-all-v0.13.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6828cb278bdee6ee23afd1b12ffefd2a09c0e73df88cb9d8ef922e06efdb74c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-all-v0.13.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30dcc56bf68b3f898155a5b4743f913acb9dfbd655d9994b044de836f232fde6"
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
