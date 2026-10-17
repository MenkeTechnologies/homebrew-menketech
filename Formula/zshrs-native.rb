class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.51"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-v0.1.51-aarch64-apple-darwin.tar.gz"
      sha256 "803733036628d3d83e34bc485f291dcda6ac3b3a6573cba0a5e02d470904d2de"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-v0.1.51-x86_64-apple-darwin.tar.gz"
      sha256 "14238d14fe5be83d61928d24321af016b0595712235ef82681cc3bfda194a11c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-v0.1.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04ee97bf346bf76d7a123f793e168ae3ea56e04af006f22412b5b481f2eb8f3e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-v0.1.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe29d2ed6ce27bc814be5c83b25d864229db832a2e6b82d64410b97bb3cb34dc"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.51-x86_64-unknown-linux-musl.tar.gz  sha256: c8ff94f627ce1866fa31821d159318d83c9c7ca455983d5b5c0a69ce55950883
  #   zshrs-native-v0.1.51-aarch64-unknown-linux-musl.tar.gz  sha256: d92c3dd8c254f491a6b32ab5a4d5f74988d70e6f2c48086a2827f8002dc01e88
end
