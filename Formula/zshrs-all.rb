class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-aarch64-apple-darwin.tar.gz"
      sha256 "6d2f34f4644a58dca5cf750a5272ec7d72a971ca80dec7998f24e7e812b89dc4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-x86_64-apple-darwin.tar.gz"
      sha256 "5db870c9bf063e05c1de6eded1a38713b3d0e391dfe6fe8a540f064c8bbf7b96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10b5a192f0220a08117b04265e8855cf354fd5e288c37afd3884934a1b9689f3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-all-v0.13.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1028a1e9afa10fb4e32c2472dabb39a5bb511c88895d0ce346f654d7aa6adc0b"
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
  #   zshrs-all-v0.13.44-x86_64-unknown-linux-musl.tar.gz  sha256: ecafcff008871bc8d17c3ba216a775ee753f07098fdc4f31cae2e66b8d2c0586
end
