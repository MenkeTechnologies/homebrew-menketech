class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-v0.1.48-aarch64-apple-darwin.tar.gz"
      sha256 "8ea44ccd576838b6217b0b74df5a73ccfb58cd156a93e982a19201d546053add"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-v0.1.48-x86_64-apple-darwin.tar.gz"
      sha256 "4dccc28b7303c7dcd512ba173abf4946f8b25f2f4ce900883a81d1bf72531df6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-v0.1.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02c638a5d435f75e437558ae342b31c45fadd6c7dd371af82854372b22ccab46"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.48/zshrs-native-v0.1.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd848f709869327509176e739e30ab2962d3292d7749f9210b0becbc9f3cb381"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.48-x86_64-unknown-linux-musl.tar.gz  sha256: 8944e39cdf99b8c435c1f1cd03b51541aa95ae2a7302ab8637e79212076c85bf
  #   zshrs-native-v0.1.48-aarch64-unknown-linux-musl.tar.gz  sha256: 3acd724e8a41e111d30759e26f57ae28cf1205b611ef800e13aa6f3633ae3c77
end
