class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-all-v0.13.38-aarch64-apple-darwin.tar.gz"
      sha256 "022c7b0a364e29186ea441ca2819a9427d4de87ec2e28a5091af2648aa4047e0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-all-v0.13.38-x86_64-apple-darwin.tar.gz"
      sha256 "dc48798fab633b06b5478a46a136379dfe93af272ff39c711aae363af01ed922"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-all-v0.13.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6c41d5b4e21d57b122a45465860c52a5f53c831e307fccdb6357b3e0f6850a8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-all-v0.13.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76b0aed5beb35686d6f23869b447a13fa0561cf817343b817fef2aa7fddac7a0"
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
  #   zshrs-all-v0.13.38-x86_64-unknown-linux-musl.tar.gz  sha256: b6a6e73bf104bff422b55ec211df392c67bf7c7201ad5a63fb1be9fdf04a8aea
end
