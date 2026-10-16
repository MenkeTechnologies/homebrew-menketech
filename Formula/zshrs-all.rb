class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-aarch64-apple-darwin.tar.gz"
      sha256 "36e4716cf8ec186adcaca27c3591b4ced830261e13901768037f3973a7227272"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-x86_64-apple-darwin.tar.gz"
      sha256 "ccbcc25c435e6d23869d8410f4920025d12ffc10ecca96600f7813e06406fb81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3de890827d91fbac7070e64ebb48ea74f622b56c9f5e14b04f54b56573e59b1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8de90bb15a1a9bfe996d1f1c9ec1a573e44005ab08371a728b14be87a6d4c9e5"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.48-x86_64-unknown-linux-musl.tar.gz  sha256: 289bb7e6739249c984e724c1d0bc8369b388ec0cb05773c440274df08b7c96a0
end
