class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-all-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "2753978213704f2e040e4ae6230b04bc7c1a302bf8862d4448bbb9b0d954f522"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-all-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "4b917a7d2145f182c4c3045861ad1d22150bd91c33fb00396d46a29206ceb4d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-all-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a46153580b78c75d1c4d43e474a2445a356c623398e69e64b0dd62176bc7000"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.0/zshrs-all-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cd650db45bb10339da8b13ba12f22cbd4f7cc7eb225aed9b018e64313e9850e"
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
