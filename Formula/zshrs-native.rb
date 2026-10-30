class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-v0.1.55-aarch64-apple-darwin.tar.gz"
      sha256 "212bc36a0446844d52d3470fb7105cee065db3a4b3f7784a6490188af9fece84"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-v0.1.55-x86_64-apple-darwin.tar.gz"
      sha256 "a8d6ff87e0ab212915490636b179dd0b23c477cc17034590a612d20dc16d5566"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-v0.1.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a396a00eefd573189fcc75b39d5ce1990ebd234e8dca89595f8cf1eb51cf2af"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-v0.1.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44bd1ada81ffd9b348d844ab5984da341163509dfa4cb1a707e877830c356566"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.55-x86_64-unknown-linux-musl.tar.gz  sha256: 32534a74b23c57536398ad8253e8cf62a8687b3aa1d28847c619785847c6ede6
  #   zshrs-native-v0.1.55-aarch64-unknown-linux-musl.tar.gz  sha256: 46d23742e52b9f4b3cb9b574b095d9d084d442a46fd3a634c392f6c8f70600be
end
