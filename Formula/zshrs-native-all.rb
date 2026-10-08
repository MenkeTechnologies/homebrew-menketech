class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-all-v0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "31cee4aa95896a245a25d70669b0693a513c05569d0a3c8bf9cd11ef12240b65"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-all-v0.1.26-x86_64-apple-darwin.tar.gz"
      sha256 "d086793cecf8c5686f02787aba271447780778cb64d66165d5811515ebcee549"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-all-v0.1.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa7c7e8c3f231bfd668947c37e12623aa08814bf845e4a01284f12f91e1445fd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-all-v0.1.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b23971480617aee9ec1b189dbcfbb2e4bc5706f9c6590cca4f04a1de4acc9a1a"
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
    assert_predicate bin/"zd", :exist?
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end
end
