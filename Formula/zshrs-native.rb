class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "02fcb3641b86628960eb0d153a42476cf3bc380b0daeaf7468868728e29d0b5c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "ff836d0a947a87ed872faf8df05e423ba22634aae02e03ccd027f122fd56a693"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9852a7df4efb176837540fa43e8294bc3a14ebec00631cd2aab5cff3a21629b2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "719357bb470a186358f7b4f19d99cc832f63c5b63627534b04362605a4e33c4b"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.7-x86_64-unknown-linux-musl.tar.gz  sha256: 69f2bd99054ffcca9e6519bcd77bf0c64ba1eed6cff0fddef5d4f6ee5f9ed7fd
  #   zshrs-native-v0.1.7-aarch64-unknown-linux-musl.tar.gz  sha256: e14e489cf7f939fada65ad47bca0b33c9c07cd7c203c64a602f59dce55fb13f6
end
