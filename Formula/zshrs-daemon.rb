class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.74"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-aarch64-apple-darwin.tar.gz"
      sha256 "3e2e0848a15f3589d237c511b254be98b036242035f449f50a65aff3fddf0a30"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-x86_64-apple-darwin.tar.gz"
      sha256 "42e48ab2834f4c32dc58e423d1322afc6d13b900ee33a9e8c83b03bbf24084ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8556551fd17e6a23e8f58338f0d36d3c8b21a9fb1e5b318b92b9410a3ea7eeb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19777f11fcd07c420c9613b5d440d9148f7679277dacede12466cd7be2b1d3de"
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
