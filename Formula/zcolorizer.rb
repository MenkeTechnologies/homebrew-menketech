class Zcolorizer < Formula
  desc "Real-time log colorizer (ccze/pygments port) with customizable regex rules"
  homepage "https://github.com/MenkeTechnologies/zcolorizer"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.3/zcolorizer-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "1e3604d35432925d5a00496b7f3e78bc4a141c1eba854ad3b13dbc66dbdf6957"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.3/zcolorizer-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "48080e98d3300a5a9f88420aebbe75a5805ff61abafee4dc130e7f1044813b4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.3/zcolorizer-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c755d11c9005bc937605e6ba1252535b4cbfe67c41ac2396d16fd4c996a5416"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.3/zcolorizer-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7cc41b7c9f9d744bb374ccb306ea23c7c1a36ac708c6f2a3873e5607c589301f"
    end
  end

  def install
    bin.install "zcolorizer"
  end

  test do
    assert_match "zcolorizer", shell_output("#{bin}/zcolorizer --version")
  end

  # Static musl tarballs also published at this release:
  #   zcolorizer-v0.2.3-x86_64-unknown-linux-musl.tar.gz  sha256: abb2735e2053d4235182f31670131d98c6460c9a7d18a2deb1f2fc7c03923fd7
  #   zcolorizer-v0.2.3-aarch64-unknown-linux-musl.tar.gz  sha256: e0fef7c3070e837753fed558c3d39c39e59796a8ead9302749648566059f44e1
end
