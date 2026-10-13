class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-v0.1.45-aarch64-apple-darwin.tar.gz"
      sha256 "aaa7e6822ea3574f3c13d684e5a06ee0d7e44ef3b3036d29c13f063c6649c2ff"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-v0.1.45-x86_64-apple-darwin.tar.gz"
      sha256 "08379c31c79c62a93465ba0d5cc782eafd3221f5a3ca4f0ede2d23c6c10dc425"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-v0.1.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b0f038f9e9ed856a3e2208a97fef1d0196992b313ca4cd9f7af7b7f2be07481"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-v0.1.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5bd78169557d54c1f1af37d699f41008b50b418dcbf1f1698e8cf5b732d8612"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.45-x86_64-unknown-linux-musl.tar.gz  sha256: fcae5600b3663cef6b2e2388f9345d649d0765979e264c8c82fc9ba6e6bf577a
  #   zshrs-native-v0.1.45-aarch64-unknown-linux-musl.tar.gz  sha256: 47aa12d82c974ea7540d71236b75edaf7ee85a5a84432a6f4d77a7b69ed1d4e6
end
