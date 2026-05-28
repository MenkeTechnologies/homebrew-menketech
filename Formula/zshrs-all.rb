class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.20"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.20/zshrs-all-v0.11.20-aarch64-apple-darwin.tar.gz"
    sha256 "f404eba2c9de4954deb99b5088c88acc8e4bfa90fc3be25ae7a109be72b97756"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.20/zshrs-all-v0.11.20-x86_64-apple-darwin.tar.gz"
    sha256 "1db3eb2cc07e641e678df9169a97b902d6ff4cd00d579e1bf3bbfdd314ee217f"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.20/zshrs-all-v0.11.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "98eb0a948d1f81c132ab5a7b0c092d440b0af3496dda255a11cf3a40e5a7ef9f"
  end
  end

  def install
  bin.install "zshrs"
  bin.install "zd"
  bin.install "zshrs-recorder"
  bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end
end
