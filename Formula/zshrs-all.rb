class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-aarch64-apple-darwin.tar.gz"
      sha256 "eaac97098e161841e00d55566051ec9b72d5bcc216b2c0d88814bd55f5b76ae7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-x86_64-apple-darwin.tar.gz"
      sha256 "635210dd5db3a63769902ed90c51692dafa1db458ef5676e2842752902f89575"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d38cee05565f2bbd7a01d5eba73150a160e2227e93ae38909e40e696eaa86a0e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.59/zshrs-all-v0.13.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06a92a1202e6b935480d097ad4b91c867034e1f1736be31248d031b55c6331db"
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
  #   zshrs-all-v0.13.59-x86_64-unknown-linux-musl.tar.gz  sha256: 828f71a8b731a866bbf4c23c041791650ba3857f4e729b2f612aff0d1bd2618c
end
