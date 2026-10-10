class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-all-v0.13.24-aarch64-apple-darwin.tar.gz"
      sha256 "df03c56e721d6fb09c2587031ce2dd82b4ca5d275c4a597f48241c29844e8e73"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-all-v0.13.24-x86_64-apple-darwin.tar.gz"
      sha256 "ce8edc1488911c2b5b6b14753f4658b8e6519f19cb0409427500cf312b200bdc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-all-v0.13.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8987f52cf924d5f59eee3a6f719dd477446c9f35798b89ecbec01f5640d0a5e8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-all-v0.13.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "148acf1317e63d8dd46944ef4a44f857b7b8a855cc7db8a2e91eaf4a7087238b"
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
  #   zshrs-all-v0.13.24-x86_64-unknown-linux-musl.tar.gz  sha256: f0db82a1624d2c12c6dbd94e1c772cc389df4868664867234c5459a22235d647
end
