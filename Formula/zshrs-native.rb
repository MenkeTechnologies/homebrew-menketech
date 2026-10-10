class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-v0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "21090e487b2a4942970884dcdb2eba840763fa44686d6e0b0715bbc284c57c1c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-v0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "6ea7a2764d03a9787f5f58be9b26ca545f3f3fe15f49dcc720d1a67ff1e450f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-v0.1.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b343b773dbe70d8a58abbc549e0c8ca5da90cbb22458c1a3ddb23a7af17fce6a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-v0.1.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f61e28a7dc919a2b9e557f06ffa58aa1b189b2297d91c64574d51ae025732bfc"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.29-x86_64-unknown-linux-musl.tar.gz  sha256: d204a47dc59537a1f7272566f8424f0fc6eee45efc43c59388f6d3d4f723ea41
  #   zshrs-native-v0.1.29-aarch64-unknown-linux-musl.tar.gz  sha256: dcecfe24f1add7b7e69ec4ddf3bb38025649728ff99de2defe5cd7426878bad4
end
