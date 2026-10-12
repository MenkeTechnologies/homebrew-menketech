class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-all-v0.1.43-aarch64-apple-darwin.tar.gz"
      sha256 "6e15c2218e911e9e91d3232594f1619ec796f60a84279f40f086361a2648edf0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-all-v0.1.43-x86_64-apple-darwin.tar.gz"
      sha256 "a8b2059e292a63f11b245cd5c63741a8392a32de5320b6e732e229f7f6db529c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-all-v0.1.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "654c781a1009416daccbc7140fd8ef05a64fddbe907c96cd261fc40aca8f6949"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-all-v0.1.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b9f47ade9859f5986b33865d79da56d03c6353a54cc6f7796593fb15dab1ce7"
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
