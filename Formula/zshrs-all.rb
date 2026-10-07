class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-all-v0.13.9-aarch64-apple-darwin.tar.gz"
      sha256 "ff612f11ccc51a476ff406ce625ed6a99d696f719fbd10ad5257b4bf445a678b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-all-v0.13.9-x86_64-apple-darwin.tar.gz"
      sha256 "beeb89254df48a14252ef321adfbe1b8d589d24ccd15790f0496aaf8f82e328f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-all-v0.13.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05898b71904650baa6d5ab99cd218f04c31e2e5142433ae69fc0a36b41359d38"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.9/zshrs-all-v0.13.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27350bbeb21bb0aa25bc1923dd4c3d167ecb883e45384b66408af22ec64479ff"
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
  #   zshrs-all-v0.13.9-x86_64-unknown-linux-musl.tar.gz  sha256: da236d1bfbd994980f80cb0fe143c090f2648369c30359c5021e3738b83550a0
  #   zshrs-all-v0.13.9-aarch64-unknown-linux-musl.tar.gz  sha256: c5be67ddedb55cb578b5d86d2513c011c752e8849b1cac50ed4e7570fad19682
end
