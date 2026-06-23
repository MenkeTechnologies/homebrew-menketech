class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-all-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "098a67e55054dd757bbe5b7df6456ac4560b36ab676f4ddb91805e61c484b7c6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-all-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "a1164427a161d28e9cb90febd41c5af7898a2cd033495de8f1f1b869e6eda10f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-all-v0.12.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a6075aa35931114e438ccca19e01beac719c6d77541bd654b7b5a022b25d9c2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-all-v0.12.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c23436153345872ced3ff191a27ef613264fbf38e387a1003c8a715da73c4d6"
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
