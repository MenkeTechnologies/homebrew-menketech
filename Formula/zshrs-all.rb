class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-aarch64-apple-darwin.tar.gz"
      sha256 "92bd15f0bbe5c700259a7f7dfd86761b75eb661f1dcfc221edf91a242285d7cb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-x86_64-apple-darwin.tar.gz"
      sha256 "a36214baf3eca868a51906d3bc715f1c484935a4fc210e4b598c455d7ab209e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa28f475c9bd2665481e4ef821ea11ccdf95281e3b8960bc78f52a41386187d2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6431080baaf8857eb0980cb0ce25b2b801f5e62712583ebca72e0eb29409411"
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
  #   zshrs-all-v0.13.8-x86_64-unknown-linux-musl.tar.gz  sha256: fcc5fbd677d156b9d88921521a0dc2d2dde6a8543b35fe67f760e1cc39feb284
  #   zshrs-all-v0.13.8-aarch64-unknown-linux-musl.tar.gz  sha256: 4b0b8cb7327b42d8ff41e724e77f36968cada3e3c740f7846b11f2f3bda733c1
end
