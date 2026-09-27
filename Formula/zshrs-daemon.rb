class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.66"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-all-v0.12.66-aarch64-apple-darwin.tar.gz"
      sha256 "f4c861163673b0db5624d3f0562bffb63ae6e86be2bbc918a04ab0b60a79fc5e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-all-v0.12.66-x86_64-apple-darwin.tar.gz"
      sha256 "f1ba17f1bcf0b78980ab35ee7779f76ea412df7646eccb4d6e734ffd9c5f8a81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-all-v0.12.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f3446d8fa37fae6c8a46203ddc17f3a3e85e36b05f027f8d986cb3d661c47d1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.66/zshrs-all-v0.12.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4edb64be782c10b53ad305a230a8e51eb8c603257593cab346a52e6d51b93882"
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
