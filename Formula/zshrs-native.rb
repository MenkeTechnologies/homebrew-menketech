class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "5b624f09c2ab032020a65bab73cbd4a6421b57bd3a6d1b8d094a46a43a404f30"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "6c8f7c690f15d593870a161e3767edf1312a90ec7b7b4cfb66f88942e52d6ee1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "801495d334963a34655c96ec9a80f5a6929e3b603dc5b6dfbc4f446c225f6caf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f658ec2ddab07f68fb941003db61440e605960f2a6c9bd89525427dae7db5571"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.6-x86_64-unknown-linux-musl.tar.gz  sha256: a67f9db2d74ae0a56efc9e6368e20fde019bfaf25d779e122ee8cdeae3201dd7
  #   zshrs-native-v0.1.6-aarch64-unknown-linux-musl.tar.gz  sha256: 1f7ce13a576ce54ffebdd0b39ea8beff357e4ab78da9442831be812adee25b6c
end
