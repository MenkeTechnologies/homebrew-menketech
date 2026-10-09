class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-v0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "618955bdbd91e002d5207803f1057c79b095c3027068706c601b78b4f78dd30c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-v0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "2bdac42618795bc9c627d6f784bfb59ba27a98221f55e155452a4cd16ff8273f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-v0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8128c55d89598b1a8f92c5aec151ae83acc0aee7b3172e5b0275b68d953e694"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-v0.1.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41f4043122541e438904c63d667e718db0114912d8d10b8a16bf63d7955e4867"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.28-x86_64-unknown-linux-musl.tar.gz  sha256: 9f528a6a9144d93017a8c45a7da6d8446f57463db81528a25a3bde44d770988a
  #   zshrs-native-v0.1.28-aarch64-unknown-linux-musl.tar.gz  sha256: 7b5e718497fb126671699a9e1548676a9815d65b67aa93aa3023f86ceec9c686
end
