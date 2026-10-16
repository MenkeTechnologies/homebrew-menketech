class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-v0.13.45-aarch64-apple-darwin.tar.gz"
      sha256 "a6f6c4633f2916962a9d6278f599f365647e57fecd6a66213a1ef6a7f291661e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-v0.13.45-x86_64-apple-darwin.tar.gz"
      sha256 "d7518ce2e6acdb90327c3ac2cb7306435b398d02dea2916415c7c49ff11f5223"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-v0.13.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bef6efe48673b2826bcebef566651dc122c8c5ebb5c1787541f1b34fcd17db24"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-v0.13.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c9985c22cbcc26213148dc4e9b42b3a280d34cf0f172ab36f79e0cf5d18c328"
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
  #   zshrs-v0.13.45-x86_64-unknown-linux-musl.tar.gz  sha256: 00b0d023cfa7fab44e7615dad665d81e45188955e4024db50cfe9cccc6423ab7
end
