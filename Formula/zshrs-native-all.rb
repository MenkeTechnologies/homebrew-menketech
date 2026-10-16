class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-all-v0.1.48-aarch64-apple-darwin.tar.gz"
      sha256 "236bd1ce52e2ec78995817bdda8b1696c5610a5535eb50c2863096663018d869"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-all-v0.1.48-x86_64-apple-darwin.tar.gz"
      sha256 "89da132eb1687693f334f5b198ab04e99488c8c229045676f07c37b2089eab9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-all-v0.1.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3d1a62f8fdfef2b90400bebe9bc1b01d70de1411dd586b3a346a6c492d314a0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-all-v0.1.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f49e0d3110aeddba0c5722c89a1e5d86d79adad8e253a1056dd2946d03419cbe"
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
