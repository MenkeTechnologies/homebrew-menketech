class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
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
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
