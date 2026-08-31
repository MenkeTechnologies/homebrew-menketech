class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-all-v0.12.55-aarch64-apple-darwin.tar.gz"
      sha256 "b8a1742b0ccdc85c5f2a87bb40eb408caa4f464f3010f7393744cffa12de105a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-all-v0.12.55-x86_64-apple-darwin.tar.gz"
      sha256 "6c2f257fa82ed752efdf2f1ace66461fe7f5370d4fa5468e02ceb532cd2dfba1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-all-v0.12.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5aa418aa1470ae7d8b3ab4f6af6e6c0c72462ae4edd7715eaa7d98e1b9cbe37c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-all-v0.12.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14bc05d96400049a54b4edfb4dcbac399787e282bd9b71577ccafc356def18fe"
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
