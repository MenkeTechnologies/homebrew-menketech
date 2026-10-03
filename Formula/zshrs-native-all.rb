class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-all-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "eda6203f16489688f67e1c2869ee52fb89366f9b1c90dc70e2ae86dded09a6a3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-all-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "71f0098a1dc9dc1bdd4de7f611e834572280df356883b64260f59d81b1fc0c0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-all-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b183e3c3e8664ba6238594a9d79918400cfbb21c88d2b0c8c00421a23dbf5ea8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-all-v0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "766d0882ac5919648e9d8ab2be52ef02e7fd17cf5e5d2e2a848859cb2dff1a00"
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
