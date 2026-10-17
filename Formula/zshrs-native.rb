class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.52/zshrs-native-v0.1.52-aarch64-apple-darwin.tar.gz"
      sha256 "50ac8c8e4c6e6366367841c7fb26ab890fd8c9b0f30d111e49fc55402c60b427"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.52/zshrs-native-v0.1.52-x86_64-apple-darwin.tar.gz"
      sha256 "f607254c9144e0189d8420fa4a68b3d2b8a19c05998b6e7afec39e0906653bbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.52/zshrs-native-v0.1.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d367a10c90aee835cd745ee725eeba4c6d8be2c8d64f729f234c7b1ab97cef5a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.52/zshrs-native-v0.1.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3f2f1ee68e239649285b0a248ffa56a13adabb2ae7b2d936557f544bab5aedd"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.52-x86_64-unknown-linux-musl.tar.gz  sha256: 46ae9c33a2ab890c7b991bc5d16ec7d7544003a24645621f5fbf0001bc62e724
  #   zshrs-native-v0.1.52-aarch64-unknown-linux-musl.tar.gz  sha256: 33c8d039fda84e544cf7da644b1991c5b228b7689df264c1d20f64ba83ea16b8
end
