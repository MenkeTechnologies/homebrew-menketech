class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.82"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-aarch64-apple-darwin.tar.gz"
      sha256 "033a4a71c5a1f78601be596a078f74cf4b88f942c500dbabfb57a67dc1b5f8ae"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-x86_64-apple-darwin.tar.gz"
      sha256 "45c3ba477a9d24c6983550df00d314cdc1f11f3797fde0db435dc1c288117d8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0e11f5ec1fdc24e313ffda025334ade770a16879eba7f0c30a431b8390d05fe"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-all-v0.13.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a6ac8d25714391fb31ad030bad0ea7d9904e3f016c4924abe3502e6782a4efc"
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
  #   zshrs-all-v0.13.82-x86_64-unknown-linux-musl.tar.gz  sha256: b9b062f5cb01ab2a6a8ac257796d59a462ce3094e3f98f20b3a5c4e2cb6591ae
  #   zshrs-all-v0.13.82-aarch64-unknown-linux-musl.tar.gz  sha256: 5151803971b4968ff5c3148fe19f9efdbfa20c9d155608125c1555dd3acf5c7f
end
