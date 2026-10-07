class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-all-v0.13.10-aarch64-apple-darwin.tar.gz"
      sha256 "ecec5252d8885e176ab13b972726897a8e1c6d480e8d66e453196da4b04294ef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-all-v0.13.10-x86_64-apple-darwin.tar.gz"
      sha256 "b15b592fc8f50552b3b93b9cec1b347badaec63bdf4471e6613c13ebd0375442"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-all-v0.13.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb0c5bb06c6718e3fecc3463228129805972f6c844dfecd15a4b3dbb47ef0313"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-all-v0.13.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dccdb79a8fd0dd70eb65f246fee02f05de37bb23dd0a9b9b12c27569a590f4e3"
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
