class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "5c3fb16eb43829bcdda93256278d6b865695b861b7f4571e5d177462ba858aca"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-v0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "df79547b7c19dc548083d13087b77d272cd886ec6b3d54cb3616d335bcb11af9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b6a6b6101e25b75def219672976ab08adc5462594c34bc40cb2e27cf32a6141"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-v0.1.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf1ee6a824f89769e170303e2819cda29cfcbd5c9903f518dbdca6bbd87fe1b1"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.22-x86_64-unknown-linux-musl.tar.gz  sha256: 31f63842f6883defaa98b0b285eec81088ba946e8a2b7bf24302a8c3d2ae117c
  #   zshrs-native-v0.1.22-aarch64-unknown-linux-musl.tar.gz  sha256: bf5708568ae0aa3804c62be5a8ad732fa8f0f18950d1c9444bfbd28268f199d0
end
