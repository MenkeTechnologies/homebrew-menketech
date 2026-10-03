class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "ec2145c87a58f9514f9c06bf40067b619f1d7ccb0f8aaa034e7cc15bbd7d36a6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "94668c4c2d332f8e48818861ff090c5b44d32b42096216ff15837932c7462e17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e06fba26c4de578116aeaaddd134205a29662b170a89a2bbf3f7c7f0b740b38"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c967fd4c16b77c93b155d667d78d8eb2df9f070fc1c7d38eadc37548b6b4ab75"
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
  #   zshrs-all-v0.13.1-x86_64-unknown-linux-musl.tar.gz  sha256: 11e5b327f6135f0737ae36638bb54ed6544e8e7a8059c1c8d19e55fb04ed008d
  #   zshrs-all-v0.13.1-aarch64-unknown-linux-musl.tar.gz  sha256: 151aacd03e196dcbb047d0abf31426222aa6718426478917397936760883ce32
end
