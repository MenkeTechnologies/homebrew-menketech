class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-all-v0.13.33-aarch64-apple-darwin.tar.gz"
      sha256 "41aa9bf74effa5bf6d7ee018e4df5e7beb44e6468408c5e6417c9f7c7e3953dc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-all-v0.13.33-x86_64-apple-darwin.tar.gz"
      sha256 "e44b070f67dace4b6c943babaa13e7e8b3f5314bab8627653bba1c56c27f5bb6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-all-v0.13.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c51e60f50761f26320950c1f8e7446be6e5b1411b6edae3140368b99beb03f2f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.33/zshrs-all-v0.13.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9de057e4ce89a6ef90eee3cf3d2b00363573571aa1cbef7d3029c4fe76ac9dfa"
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
