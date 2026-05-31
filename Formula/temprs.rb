class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.11/temprs-v2.9.11-aarch64-apple-darwin.tar.gz"
      sha256 "d679ab11fae369ddc1cb181d979a9d6fadfa6109bd83f6a5cb766de419cef8c7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.11/temprs-v2.9.11-x86_64-apple-darwin.tar.gz"
      sha256 "bbdac185edecd786f6586258be4da4aeb5daaffd4a44bd5c63da42a04089828f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.11/temprs-v2.9.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b7f02780dccfe272d42465ef19bac4274411ace99f1a137816724ae7dcb0adc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.11/temprs-v2.9.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "314136b89ab754d5dc24ebc2a2558dff57be8c464ba0177c2958d02fde6422bb"
    end
  end

  def install
    bin.install "temprs"
    bin.install "tp"
  end

  test do
    assert_match "temprs", shell_output("#{bin}/temprs --version")
  end

  # Static musl tarballs also published at this release:
  #   temprs-v2.9.11-x86_64-unknown-linux-musl.tar.gz  sha256: efa9bc2958ef9f4e78f18f31ece2ed0ff7c342ccdd4108235f5b075b90afed65
  #   temprs-v2.9.11-aarch64-unknown-linux-musl.tar.gz  sha256: f00e4ed1224ad9b9fe3e70a475388b70382147e71b8be472555ef8f424baa130
end
