class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-v0.13.31-aarch64-apple-darwin.tar.gz"
      sha256 "d5f7ff88e0727d4f160ad6864042334aa4a5f3deb72bae8555d147ceba3abe5d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-v0.13.31-x86_64-apple-darwin.tar.gz"
      sha256 "8e890549e55734f6f48eec7394536dc2353e0496ca37b48bbb5c1d5a133973b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-v0.13.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "549875575dc3e47a635eac4641caace6e6f5803b4f4f1b7a1e62a67c09dcb686"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.31/zshrs-v0.13.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dff9999abba93401a61d930c8f7dea458c860d47454528aa1707e9bfa3f723da"
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
  #   zshrs-v0.13.31-x86_64-unknown-linux-musl.tar.gz  sha256: d56b366bbc0a21ce5f79b7a1bbd9e57f7460ca990565e2c59916815785292b3e
end
