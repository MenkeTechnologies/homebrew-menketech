class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-all-v0.11.26-aarch64-apple-darwin.tar.gz"
      sha256 "16076e456e0c3d8e894d24fcfcfb9123fa1d177dd2d9ff8eb3eafecb623a0050"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-all-v0.11.26-x86_64-apple-darwin.tar.gz"
      sha256 "2aaa8a96c1bc02358cb46cb0c6f7ac1d5ee380d333a7b2e6221ac841afdae684"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-all-v0.11.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f99591d6c3ef5849852cba98a849c4e2de35afc954e4ce7e945dede8c046bac5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-all-v0.11.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26d7888d497dbc65b2da99521c8f278ffe6a9f675c5f9497bbc0d9dcb89abaf1"
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
