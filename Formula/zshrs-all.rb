class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-aarch64-apple-darwin.tar.gz"
      sha256 "c5448c9d7eb1abf33b46726d15ee2a39ef4907742f32463b225130d6509f43cf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-x86_64-apple-darwin.tar.gz"
      sha256 "8f12c6c19c5c8b7299ad2c9f4ec01372e068a7a43da8cd5916500a078f22687c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6371e384ab8b82a0355ebcdc95ef2cf6ab4f1d521b7834a77fa934e44f07daf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-all-v0.12.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "398b885df70cd7cd46fa768069dc5c7a9eb1070cbff0d85a81949df6a665c9c7"
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
  #   zshrs-all-v0.12.60-x86_64-unknown-linux-musl.tar.gz  sha256: 18882ef724255301e8b762044906f3c7e5641ff0433c1526964587925bed96e8
  #   zshrs-all-v0.12.60-aarch64-unknown-linux-musl.tar.gz  sha256: f6b11e75d4f96b33bccb976953f50da301a5ca95de49e220fbacdc609e87e888
end
