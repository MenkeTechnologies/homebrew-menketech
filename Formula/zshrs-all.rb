class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-all-v0.11.39-aarch64-apple-darwin.tar.gz"
      sha256 "c52200db923a8cb58c1d4a9346830a52f828450f31cf4a2226847b529e6bcbe0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-all-v0.11.39-x86_64-apple-darwin.tar.gz"
      sha256 "bc626780f2787a4a2772a8d23793f8f2b5cac44051b35fb83feb27a1f2484c3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-all-v0.11.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9eb5240f68111eec7a1ad9aedf9a26cd050c1744ec6ee0baa909557ffe7655a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-all-v0.11.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b8184ed17f415ac78651544e445c34bf9fe61c01367e86334d16abf55201cb0"
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
