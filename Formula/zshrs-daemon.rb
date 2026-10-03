class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-aarch64-apple-darwin.tar.gz"
      sha256 "343b7edb98c8c44127ba8902e9f3b382d89598c443a5af38d81066e6b5651df9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-x86_64-apple-darwin.tar.gz"
      sha256 "c92cd93f867973056f62566f285b993e2ea02472768c26f909e0351de644cd63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bfe07fbd090785bd7f7d795245f6e89fc669b063e164089789c11f694997ec0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.7/zshrs-all-v0.13.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bad0106d8eec8e05bfa582025f39c65b036a2f5ceb321008361fafcfd19f5c6"
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
