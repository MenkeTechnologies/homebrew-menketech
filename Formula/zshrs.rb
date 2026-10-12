class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-v0.13.35-aarch64-apple-darwin.tar.gz"
      sha256 "912af4503dfc95e89517fd00eed8835ec21e46b2128c0a7412e89ef37daf5647"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-v0.13.35-x86_64-apple-darwin.tar.gz"
      sha256 "0b96489cd4d99ded5974218302d7a447e92e3982c0506caf45d55afe6f749f46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-v0.13.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efd1582db9764781826f1c1499df715a0d45108aafec09b58c330ce3856df167"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-v0.13.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c479af12911ea19eab34257e01dc5e7b39266f873647dd033e5734870d97d20a"
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
  #   zshrs-v0.13.35-x86_64-unknown-linux-musl.tar.gz  sha256: 85522415714812fdef96fc7a5ba669678cff9306cf97390545f95e9f35e4bd7f
end
