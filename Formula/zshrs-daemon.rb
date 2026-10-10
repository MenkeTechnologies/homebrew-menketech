class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-aarch64-apple-darwin.tar.gz"
      sha256 "0d3ed735bae25385891dac20bf26357f19198cbf310169250b38f017a6229952"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-x86_64-apple-darwin.tar.gz"
      sha256 "dd421cc42a2eedba8ff8c5958e11c39109e19c2a2d5b60e87ebed3335570ec47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47b087c84d53d236b57a90a07086908a78d99275100376144e2d9142c5668ac7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd6627d0a34e5ba958e8b776f8fb8183900a7345b6f85d2647091ebd99003350"
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
