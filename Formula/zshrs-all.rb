class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-all-v0.12.42-aarch64-apple-darwin.tar.gz"
      sha256 "963a1668228ad898d52d9d95f4fd3a320796a85659fa41e0c7b16cb5ba9bbc5b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-all-v0.12.42-x86_64-apple-darwin.tar.gz"
      sha256 "a7bc4585b03e2ae744f3a974c3c2c35d612739cb4ad9a6d4b5fe47d8b8103a31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-all-v0.12.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c799428112fa64287acfeb2137fe016d01f4203c9ce95c97a58ee0656ad4629"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-all-v0.12.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "357b09b26641baedb7d2e447bc8960870fa8cdc037a04096c3dc26116d121760"
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
end
