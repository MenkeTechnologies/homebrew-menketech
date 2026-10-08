class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-aarch64-apple-darwin.tar.gz"
      sha256 "f15459610b9554d852def7e61f1fdb00d2701dbbb2fcc004561caef6d3ad4e90"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-x86_64-apple-darwin.tar.gz"
      sha256 "bac7a9e6d23b76d449ecebb9eeb9f207cdc13163d6c45a922265c124d609e29e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98d6dfa9dd41ee469c880b6c0696907d9188b14b067f071ff2ed5c81f8856836"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.16/zshrs-all-v0.13.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ce509f47af621bb28e735f315ed8f591034cf283fc41ac678aaf72ccae419fe"
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
