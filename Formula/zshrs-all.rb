class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
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
  #   zshrs-all-v0.12.53-x86_64-unknown-linux-musl.tar.gz  sha256: 6d5175e9d09c22fa877f38c42609d5e3a49fb0044c15935d0d6b584755f9b735
  #   zshrs-all-v0.12.53-aarch64-unknown-linux-musl.tar.gz  sha256: cf7d6eabb7175a21120541688ba47253c9bb1f8915071cc52a31cdfda2db5f0c
end
