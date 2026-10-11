class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-v0.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "2c98ae81432c267e301b21ea5c816524b0e151ad52586c87325fff299e0fbc66"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-v0.1.39-x86_64-apple-darwin.tar.gz"
      sha256 "7f63435a939db286abf3fee5a069e31da32c451df4b563d782afdc0e00aebbd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-v0.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80e3a9e9e819e09cfb47b4c82bf77df14bf280a062d225bc97efab52c836aed8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-v0.1.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4e59a5a8c48f45086ed7528349c1f60b1b2368e0d1c376abad9872b37a28883"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.39-x86_64-unknown-linux-musl.tar.gz  sha256: cb1312f6b88d1d6b08af70aa002f60065eb9c8cf59c2f914a29e55aa840c4929
  #   zshrs-native-v0.1.39-aarch64-unknown-linux-musl.tar.gz  sha256: 6da950673639cc53bfe132f5607badc6b57cc1c6ad085e1ce3c910245b910953
end
