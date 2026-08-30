class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.53"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-all-v0.12.53-aarch64-apple-darwin.tar.gz"
      sha256 "25aaf99ff13f61f9873beaf6c0db3a1a78845c29a031367a5d39a470972342b3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-all-v0.12.53-x86_64-apple-darwin.tar.gz"
      sha256 "b0413bcb96776330dde5105f184a5e849fc7d3637bae6867be0a701cbf2ede32"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-all-v0.12.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f312c5de366122a35951089ab0518590e8766a5458185e548ade280705793bbf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-all-v0.12.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2c7242781154c902b5422263f99e6f5259297d10f228f87999f18a15c722ef7"
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
