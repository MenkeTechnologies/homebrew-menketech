class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-aarch64-apple-darwin.tar.gz"
      sha256 "35891e19b28629f7b34223e6debc2f5a3fba53fe2c108198df5c0b23834a019b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-x86_64-apple-darwin.tar.gz"
      sha256 "2697de762eb8da0a52a4c93846372015cbb43588061be12ea97e65320bdeb489"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd45f0561220e18edfee4b20b62e9ff65f609d1b97610dc4df95b8d8141fcedb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f049118710f1edccf717447cb6e3af6d8a2e64f0cce2e7bf312003341e7b3d99"
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
  #   zshrs-all-v0.12.62-x86_64-unknown-linux-musl.tar.gz  sha256: 4716db1559e78abb0d623e900641b4196e50994e8168cb5b22febdab676b842d
  #   zshrs-all-v0.12.62-aarch64-unknown-linux-musl.tar.gz  sha256: 5cba5665cb8227008e8d9d72a1f8d74710f4ff3c6004d20ce4bb3d2d60833aa2
end
