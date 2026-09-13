class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.64"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-aarch64-apple-darwin.tar.gz"
      sha256 "5434daeffbe74b93cb5f061a501c38c76856366fa26f0ed03bb7ff15c922b59f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-x86_64-apple-darwin.tar.gz"
      sha256 "ccee19e181c4fb5f55dfffd558079e1ee76f5f5d3b1714d200e34ae7216a45c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1746a0a421a074c8fa332dca1e755d73fe5d162f32411ceafc3647e2dd69b1e6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-all-v0.12.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be3e47fbe263fae679a91870e55386ab8f8f99dcb1b39a8f8fe22426b94a8d74"
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
  #   zshrs-all-v0.12.64-x86_64-unknown-linux-musl.tar.gz  sha256: 15c22745e9b3abf2b08a5d3070dcb203defcc2f250a0a67a13b404b6773686c2
  #   zshrs-all-v0.12.64-aarch64-unknown-linux-musl.tar.gz  sha256: 8261eb2958b4231e55cd8f685bc184222b05cc6efbe3558ab3c308ca3052dc39
end
