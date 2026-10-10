class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-aarch64-apple-darwin.tar.gz"
      sha256 "69646c49ac5dffd0644529c1ea7a454a50b4ff70cf9424ef7b560c21e607844b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-x86_64-apple-darwin.tar.gz"
      sha256 "3204e3dce9c2aba3b05882c9644927bc8788e197aff1620b4513f3cd5cc31a85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fca254370998485c88458ea03b1d9ea47792946df499810f58ac07abbbe502ff"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-all-v0.13.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3f217a06c386a8c069cbf9e3a876e9172108f759f2defe99f7e91764f7b0253"
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
  #   zshrs-all-v0.13.30-x86_64-unknown-linux-musl.tar.gz  sha256: 4c3056c1f8604b9e415bc003accb2593b377b46a22c58e31d119922a71a13877
end
