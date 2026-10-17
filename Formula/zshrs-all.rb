class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-aarch64-apple-darwin.tar.gz"
      sha256 "0a2d3bae9aaf47c41c7a87c8aa9c36527940ecb3ffbce49583bf141b75b6acf0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-x86_64-apple-darwin.tar.gz"
      sha256 "ad42f07218cf5c690141f2d09c7a67c2f6b6fb3a89111b341ee3ac47b12bd148"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53f8c93254537d48e727641578bdaeda9bbf0f6da42b84bb1f6dec010e0f3ea4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-all-v0.13.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc470086bf3a933396d5f33d797c0cb77a4144a6435ba3d4b9e8535d2e88c07d"
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
  #   zshrs-all-v0.13.49-x86_64-unknown-linux-musl.tar.gz  sha256: ea879b3cb4dc02bf7ec140a1816968fbd5997c1a86de7602d75538760ad1bd44
end
