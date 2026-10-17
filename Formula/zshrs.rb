class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-v0.13.49-aarch64-apple-darwin.tar.gz"
      sha256 "da4c38b43fca8a01657bd8d392b6e8556f1c7b57d3b4092577e0569aeda9c572"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-v0.13.49-x86_64-apple-darwin.tar.gz"
      sha256 "6055503a4d2ac5814e53b574878a7f25117e9822b98f01a9fc72894bfeb28f84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-v0.13.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9e756c3b15e4e5e12fdbc6985f525d152e33ac87a2e486f46ad0c998bc4a1a4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.49/zshrs-v0.13.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46fd8ae036f3eacb4f7f8980da4b68259a90393b6843b1282d9fc364ab32f87b"
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
  #   zshrs-v0.13.49-x86_64-unknown-linux-musl.tar.gz  sha256: 568ff7568c32b071dd3be6fb450f3557b885552a226c7d0519e8f8fb81aad7c3
end
