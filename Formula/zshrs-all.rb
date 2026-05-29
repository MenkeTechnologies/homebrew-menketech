class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.22"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.22/zshrs-all-v0.11.22-aarch64-apple-darwin.tar.gz"
    sha256 "703eac02983fe03970964ac8cab810a23d175e48523a5ccea0fda88e33a8fe88"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.22/zshrs-all-v0.11.22-x86_64-apple-darwin.tar.gz"
    sha256 "4dbe003a3bfcd08dc059164b807cc6722c9500d26cb5861e384eb77bfa61e3c7"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.22/zshrs-all-v0.11.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0ec8c1da3782cedb638ff4dcaff5a3cffbead0538942940e17b732ba7c502a44"
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
