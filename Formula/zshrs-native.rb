class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-v0.1.43-aarch64-apple-darwin.tar.gz"
      sha256 "7431abfd9d97c6e0476647a093c17bab54a4b7fdbf4f2dfdfda26229fad62801"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-v0.1.43-x86_64-apple-darwin.tar.gz"
      sha256 "460db01d47333bf4ddc00aff74967627ed4c8a6a1dd4749dd39df6e0508c3e7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-v0.1.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4dd5ec3af1ed30b897c62a5b704a5f59090393fa6890b34b60dce1b0eca206d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.43/zshrs-native-v0.1.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a58f676b828d2fcbb557be084029836a7c0ae15eac462ad734d2c9489b55e575"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.43-x86_64-unknown-linux-musl.tar.gz  sha256: 9581a63ac88f6f15cac08b61cbec2e52670b1cede4e8f08d342ba6f912264ae6
  #   zshrs-native-v0.1.43-aarch64-unknown-linux-musl.tar.gz  sha256: 8067a5a5f0644ae615b3770bffd3f31ece7d20b70e9b555e800d2d56482bb1d4
end
