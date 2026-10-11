class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-all-v0.13.31-aarch64-apple-darwin.tar.gz"
      sha256 "11c41dc6451644d84e6eeb5894e3f2dbc9275aed83e9ea3987e4faca5825b399"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-all-v0.13.31-x86_64-apple-darwin.tar.gz"
      sha256 "f340a17600a80499f96ab95da515379026065d9de5710f0334b9a491bb4f7bfb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-all-v0.13.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57dc2a3c6945288a8bf1587a44d3cd7e20515bcf58d01f36f1a6f35817901db1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-all-v0.13.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ebdfb7ca058325d27b602242b2f5ade1c7b2c15592b82e1e1ae92b837a43e316"
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
  #   zshrs-all-v0.13.31-x86_64-unknown-linux-musl.tar.gz  sha256: 41893d182f7b7b9c0c1ef7f6303714eaee20ae0d602f204951ae0f711b085c45
end
