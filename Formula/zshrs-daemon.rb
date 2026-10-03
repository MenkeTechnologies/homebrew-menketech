class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "a2a67b865f899fc3d0fb03f9b51c57a08aedb5b1f137e877baa19b5579ba0e83"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "715a4b033821b3dd92b3070314bc9a372566b089c6f129a94c72a7548cd7ce80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5169c18432612aa7aee72bec7e3b32f76c30eba0188c9f54e922fee12b19db7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d75bc5890b7b1c9f4b443bbbce5d24d06e4326b709f313628f173ab82dfbed3"
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
