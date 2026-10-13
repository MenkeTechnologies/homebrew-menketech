class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-v0.13.41-aarch64-apple-darwin.tar.gz"
      sha256 "60f46c8846c17159d5b80713437241743500c1aacbf6445e407196b60c163036"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-v0.13.41-x86_64-apple-darwin.tar.gz"
      sha256 "b33ed0f3f71cf81d81302f7b3dc7d2adb33915fc9c3754848a36b1423dde8d82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-v0.13.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "536c327e72f5b63ebed2d1f3aea0e2c73e151958175a7c88882f8b6734bdaf9a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-v0.13.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aded080534411a34aa0ada07f0ae320c09f9410460f7c7fe8235ed944f6d58b1"
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
  #   zshrs-v0.13.41-x86_64-unknown-linux-musl.tar.gz  sha256: aa1e4fae4aadaa43cd8d1ce18139f2608b8d2fc5ce9440081c16d306c2fe25f7
end
