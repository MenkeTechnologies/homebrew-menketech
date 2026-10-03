class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "8c782c6fe6aa3a9735609b7defa3fc45d4e3803161d53d799bc0055f1f648abe"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "73e15453ef3d2991073cb108c1489e149b8bae33c356efda74e6b80efa485e54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4c65c15736a8bec3659db31bd1c7deb337a22cab23d43c479d9fd398a13093e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-v0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7dd24a3e1c50ca41385ddab5bb25e16fb30aad0427c6dbf705835368cc3beb74"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.17-x86_64-unknown-linux-musl.tar.gz  sha256: 27a3ae0143c1e4873904896a5bf35f55eef27be0084b713bb01280cd114df38e
  #   zshrs-native-v0.1.17-aarch64-unknown-linux-musl.tar.gz  sha256: d1d8b7b4722274a5b86d35136c67bd9a1ac9452b2f714f8b5868b51627b0e750
end
