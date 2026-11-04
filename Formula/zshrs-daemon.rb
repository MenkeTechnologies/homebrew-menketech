class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.61"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-aarch64-apple-darwin.tar.gz"
      sha256 "1362fb3c88b3bc6dd6c02622fb79372cc7a56664582ca39feff949b89cfd7dd2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-x86_64-apple-darwin.tar.gz"
      sha256 "0ffd21a3d904d1d67fa9ea158987a988ed7337f7b4f801c9c3c3f65df0510454"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a82b7c377407c9b03352ea20642c702a2b998e549778612fe6ada956ad073140"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d9c60f192d18da7c55e05f09f3e6d2861f397baf3b77464ad1eb640636ae7b9"
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
