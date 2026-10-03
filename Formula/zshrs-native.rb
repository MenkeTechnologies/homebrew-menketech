class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "13b8d5ad6b09ddc83b6a78c246843591cc77ff01e0a20118e8e04ed9e1117f8a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-v0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "9b6e00123ea743ab0f9e68a2a3df1b8f684a411ce38112a29c782fad9e2bb192"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ac5541cf7c3370fdca528c92fd4e4a777e29f0dd77d1341f132e863f3e53cb6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-v0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2f22ecc68e74f54fa37bc02fb2dd2a35c01858c37b80c41d5a042f639137ec0"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.19-x86_64-unknown-linux-musl.tar.gz  sha256: 28841ad757c066becdd929e5bb2f6cf0e0f0a4366b6f7ad684805d0b6e26ceb0
  #   zshrs-native-v0.1.19-aarch64-unknown-linux-musl.tar.gz  sha256: 0a8793503ce09ef1d4f6d18e7057980ea970d825385a074b88c50d2bada11e09
end
