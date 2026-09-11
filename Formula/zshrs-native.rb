class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "3132189de09becdc1176601728c612fe080efdbedb8aa19309de7cc8217adff0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "e602848c07007a1808d4adbe2495c7cb7a0ee2a238b0249a80141124c8457eb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e4209ea79ce5d008e773b8ee184c68a454f0ed08baba0793fc0105ace0d9a32"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a47fe20ebb8879148ae235d9750b5f512767b8ad335078efcf369b9965fda60e"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: 40dbe2e864141b0f01f631dbd132b47db5df51f36f93b26dcb96856cb81612f0
  #   zshrs-native-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: 3b61c9e298001b4375d891c7079184429aa35494af6934d9204bd784f500fb54
end
