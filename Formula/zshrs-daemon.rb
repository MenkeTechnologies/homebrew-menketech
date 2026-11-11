class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-all-v0.13.62-aarch64-apple-darwin.tar.gz"
      sha256 "614e22c694837aedad528a51af508ea0c7aa2de5873ed86347c1afdbb2f14e88"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-all-v0.13.62-x86_64-apple-darwin.tar.gz"
      sha256 "aab6d6c95a29d86f83e97ef71e426ec29644136c5d56e85bf261a58f3cd4d785"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-all-v0.13.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a1ae17986bf5017525c0ea8b09ac6a1b14bfa6c5059cd4e81447673d3e8dd21"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-all-v0.13.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "226972342976971535ddf3a37020450c6cd71b79f7a97c8be4483c50fb49215b"
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
