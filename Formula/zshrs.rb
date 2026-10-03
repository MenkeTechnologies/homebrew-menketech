class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "3d7a42929c56f1ee98cb28b527d2d14427dcdc5551d83eb9d04b6e0aaf57d5b8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "32b425606a5edbfd4ddac2197f6264df2da05eefd9941dba416e324ce9b462df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44d5bb6622f6a510ca688e0e60ea252342cedab55ed02b733da13e20f7d394f4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8210f521e2442439ea5bacffb9d900fe53dd202069265abb4af6fd9f01678d7"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.0-x86_64-unknown-linux-musl.tar.gz  sha256: fc1420fb8266949496ff8c76be85e7c680ee75fa1ffbb41ff3a9f4a835d837b0
  #   zshrs-v0.13.0-aarch64-unknown-linux-musl.tar.gz  sha256: 146e4e2b59ea6d363e5114de2e33bea87ef8b904a699d44aa7889ab475576d13
end
