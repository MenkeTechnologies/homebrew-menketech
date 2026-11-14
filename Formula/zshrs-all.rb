class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.79"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-all-v0.13.79-aarch64-apple-darwin.tar.gz"
      sha256 "45f3f3f041ebfa5d66c31304cd4b830586d09b454f966667c3f3ed2fef643914"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-all-v0.13.79-x86_64-apple-darwin.tar.gz"
      sha256 "d8aa78ffa7aae02d32c60d0bd409f6407cd2c3c3e31812d17dc92621b52c8867"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-all-v0.13.79-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac7a96914ede82b8ff22a6ebb06a6cf7eaff43500332a913864299da6318c3f3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.79/zshrs-all-v0.13.79-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "703a2dc898fb0e41d18aa787a826fdf515abbfe87712deb2199063c186d8eea0"
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
  #   zshrs-all-v0.13.79-x86_64-unknown-linux-musl.tar.gz  sha256: a1c56348498699adacacdbf0ca5c4bcd39a72d116df7a2327188b6d44098ac3c
end
