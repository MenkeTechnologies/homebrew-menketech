class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-v0.13.24-aarch64-apple-darwin.tar.gz"
      sha256 "4bafd99913b9e398d5a48762855831e451d80c96ea0342554c86a2da100093af"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-v0.13.24-x86_64-apple-darwin.tar.gz"
      sha256 "3329321d9f35a313f29396ab39043444736743781341cceed2e6e4a98b35dcce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-v0.13.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd490012b91d33c0617b54d91a6427b0b20d3e5892c1b26a8111635ad7b49fa8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.24/zshrs-v0.13.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1730949b2d55fef1266fd1ad1e8083048aa6a230f7baf3e1870c00b5f4ef026"
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
  #   zshrs-v0.13.24-x86_64-unknown-linux-musl.tar.gz  sha256: df48a5cbf058caeb52ab51e9e6001c9065b82ed7c5eff4c7577e9993eee56bc1
end
