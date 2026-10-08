class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-aarch64-apple-darwin.tar.gz"
      sha256 "0d88ca2fdd881ba6063fdea3c398ad74949639eb9286fd8edf75f863d1068bf4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-x86_64-apple-darwin.tar.gz"
      sha256 "d92d9407b0572a9ff75daa557b9f35fc1536a29d4bb0c7c98bea3a378378d10e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9d84f87a32a75c7d8fbc1f309f74dc4b57aa5144c828c854deeadd2a390f325"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4367dc8ce714f86a68499589c74b9b863e304dd6d91486eb0706c33a5f54a07"
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
  #   zshrs-all-v0.13.13-x86_64-unknown-linux-musl.tar.gz  sha256: eeb4c5071a36487b47dd65d1e03ffbf48a421a2ec2497f741014a236e082335b
  #   zshrs-all-v0.13.13-aarch64-unknown-linux-musl.tar.gz  sha256: ffe2d4ff737b6749e4b79a240f1e4af3802c6242db81cdc918f922ae3985f031
end
