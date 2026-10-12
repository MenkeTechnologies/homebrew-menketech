class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-v0.1.42-aarch64-apple-darwin.tar.gz"
      sha256 "e1d99323c82b97ea2b114edd037909c0ffddca67c439b9335e8f48d7bbe6ffce"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-v0.1.42-x86_64-apple-darwin.tar.gz"
      sha256 "c512a45c48e48f5cbb0a0fada9b40e29f35df2fa51734ab98ef523d13b88c9c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-v0.1.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a325324fb7615ed902ff12e81fc96d6698bf04bfd7f8c1c5b4569de7eefb27a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-v0.1.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "029a3f425e20d3ce25478cfc41d714e5ab6fc1c9a7de0cf43f85c8e6f6ffc1fa"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.42-x86_64-unknown-linux-musl.tar.gz  sha256: e129031cc1bbfd0ad34b29b0b5a1ef34f72ba95ce363322df4a775482889cd58
  #   zshrs-native-v0.1.42-aarch64-unknown-linux-musl.tar.gz  sha256: a042f1d78df59b83ee35fa1885103dbe5e8c36601c6f273689f0a19dab7da7da
end
