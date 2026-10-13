class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-v0.1.44-aarch64-apple-darwin.tar.gz"
      sha256 "6af66b916ec91bc7519f9eebc5529c2c671d1694049d8d9175f266f95412bada"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-v0.1.44-x86_64-apple-darwin.tar.gz"
      sha256 "43a0f9dcd9c690462351724ef942428d5002ba29bf4e9d55844fbba0b5d38093"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-v0.1.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a665d874a9b1e00d4c6ac950a5cca1ac09dc2c35a1dfcc6d4c35dc67e9295c13"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-v0.1.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fbafe09d86be94ec2a719c1343f862f0ceadbc12c0b830b2cbc56ef094374a3"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.44-x86_64-unknown-linux-musl.tar.gz  sha256: fc94eac556e533ca5c4644b13cb7a860ff30edb1c4065dc5ece5807129525543
  #   zshrs-native-v0.1.44-aarch64-unknown-linux-musl.tar.gz  sha256: af3c97eb8051d023e5743fed36e296fd8b15001a11a7f1bb25bb59ef0997f844
end
