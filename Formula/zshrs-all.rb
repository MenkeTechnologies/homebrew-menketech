class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
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
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.12.55-x86_64-unknown-linux-musl.tar.gz  sha256: 4c5e29ad3c2e3144b2d3c85ee703fa1c2cedb0bcd5efab2171fd98b1fc4c37ec
  #   zshrs-all-v0.12.55-aarch64-unknown-linux-musl.tar.gz  sha256: 1d418a757ce0b312e94f1f283ef41889b26fd2fec290e5d3abfc2f21ab94f537
end
