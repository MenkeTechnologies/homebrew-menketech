class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-all-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "e641f607cdafaea15722c8427bd458282dd3af3c22cdac1acb59896a8e206cc0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-all-v0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "60ac1583412ee32751fbafe8985d3bd4c90c6ab711702b160962a943e4db991c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-all-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54d95cb39edf58c9b2f29a4adb2d1a3c8234cdc53f0b1519ee618697349cf780"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-all-v0.1.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "275a9a32678a7d1c10417755332b74c4bad271a8c5c717398385a62391070b85"
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
