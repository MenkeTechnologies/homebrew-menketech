class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "91d1e1243ddfda5c50df8cff64a8aea4f46fc8d7382ed598abdacdbcea6f810f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "52d9d9ec5d2f7d3454875346726e8435600ddce41ec8297d0d6de4c332d63fb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f3b55d65bdfcb0b38c4831ec6e4f397b506eb0a522ba210d7a0125575fb128f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.18/zshrs-native-v0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c13ddae40814338e734e9e8d7da28f50b66ccbe98697c041498238f0d35b6cb7"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.18-x86_64-unknown-linux-musl.tar.gz  sha256: d1b58c24e72b0eba2bd8252df5789a1dbe9e83f98d616a892cf84c3f7cd6df67
  #   zshrs-native-v0.1.18-aarch64-unknown-linux-musl.tar.gz  sha256: 70c3a07b8452a9da4c24a70b6dd0d6d37e577b07bc26c129936bd163985e5cc7
end
