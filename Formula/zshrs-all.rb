class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.50"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-aarch64-apple-darwin.tar.gz"
      sha256 "a2c460d1b83ba2d8b07f1cc57f1571c90993a30ba579fd2ec4bd43f1b5633ded"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-x86_64-apple-darwin.tar.gz"
      sha256 "8485f96ffdffdde095ac839fe063d334e5fc6489915593fb79564bf3395cba45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d086b6dfcb7de8121e65ab454e8305c7ac60900f5f8e08e030f3981a10fc228b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-all-v0.12.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83778a6c3f9d1d711750e8eec84650a78528ee01311785373174a58d7776fe11"
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
  #   zshrs-all-v0.12.50-x86_64-unknown-linux-musl.tar.gz  sha256: 610d907e7b90f772b6e802e07c35c75f2e63ed93c0d21f4d52453add375a2b1a
  #   zshrs-all-v0.12.50-aarch64-unknown-linux-musl.tar.gz  sha256: b4ab9af49021d613c1aa4bce12bca8a9bd717ce26055dfba6e8fd6775550b29d
end
