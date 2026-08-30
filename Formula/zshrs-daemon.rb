class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-all-v0.12.52-aarch64-apple-darwin.tar.gz"
      sha256 "f53aba3e781be0d74694bbd8f44f6e1a4edf77fd53485c790d199dc263c8a225"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-all-v0.12.52-x86_64-apple-darwin.tar.gz"
      sha256 "76797db70b634111fcda8425475f618eb7d7f77c0b935c5dd0af596c29d286c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-all-v0.12.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f38ab4dace022dc472aa166d73aed98bae55b8c7afb970c93370356e1157d347"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.52/zshrs-all-v0.12.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c880625c8bcdfd2e63239d84019fbd273546a838faf1dd018b2590714a5e7cbf"
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
