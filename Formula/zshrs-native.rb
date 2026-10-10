class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-v0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "5128983904a24ffc141e1476d38211562eb3622418e9b27cad68b8976fae4ee5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-v0.1.38-x86_64-apple-darwin.tar.gz"
      sha256 "8997bf02edb3690995fc7ed90425597d8671e3635a66e33a9e0e14b948ea76e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-v0.1.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c82847980ab2ab2b6438e70f84645b4b0d92146d3c272a07f62b2cef921c6acd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-v0.1.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f321fd7a8ac249a30f109c9293d310629a43022a479855910b7c64fa33a74dd"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.38-x86_64-unknown-linux-musl.tar.gz  sha256: 6f8c39a0c0708e67dbb1254570881e2ef5366a4725fb79ca1165ada02bf10553
  #   zshrs-native-v0.1.38-aarch64-unknown-linux-musl.tar.gz  sha256: 01f35af331dbd9eb5ed48535036573853c1f603e5d9c22d04d620dea271f2037
end
