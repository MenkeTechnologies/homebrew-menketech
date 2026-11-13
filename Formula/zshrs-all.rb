class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.66"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-aarch64-apple-darwin.tar.gz"
      sha256 "1ffe6aa07ff4790137fc8d0305297e425c3c2d5bc7f87d1f0931aa47e86387f9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-x86_64-apple-darwin.tar.gz"
      sha256 "32bf4c65a4ab8ac5f51e79b29d94e7bab1716bf2876dbf7d9202e6d94318d4af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7068518a3fe5ecdf1d071f2c1746387312f3df7110afb1fdeb56f185b1fe7e7d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91c889f77e62c6524d2594f02d0102311244070bba193aac80c2203bbff105fc"
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
  #   zshrs-all-v0.13.66-x86_64-unknown-linux-musl.tar.gz  sha256: 60b844637eeef47bf983fbed74f5311577eea2519e1bed3d5cc0f56b92dce130
end
