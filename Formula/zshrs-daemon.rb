class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-aarch64-apple-darwin.tar.gz"
      sha256 "c5448c9d7eb1abf33b46726d15ee2a39ef4907742f32463b225130d6509f43cf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-x86_64-apple-darwin.tar.gz"
      sha256 "8f12c6c19c5c8b7299ad2c9f4ec01372e068a7a43da8cd5916500a078f22687c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6371e384ab8b82a0355ebcdc95ef2cf6ab4f1d521b7834a77fa934e44f07daf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "398b885df70cd7cd46fa768069dc5c7a9eb1070cbff0d85a81949df6a665c9c7"
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
