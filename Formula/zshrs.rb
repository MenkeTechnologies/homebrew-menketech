class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.78"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-v0.13.78-aarch64-apple-darwin.tar.gz"
      sha256 "22a9a9fd5d991d3318f5955cf8646736d124c94f03d74cad7d2272fe9e18e9da"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-v0.13.78-x86_64-apple-darwin.tar.gz"
      sha256 "4b906cc93f71596c59729f96b93af2a8f12acabe9dc7428b9bd4b7a1ffe56875"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-v0.13.78-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3929d4e53a81d01f70dac1b45d74c57e7c9dfb14b74d2e4702555677dcb6c50"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-v0.13.78-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a86a1d6f300304623029dc2c5f2e74bbb4122e075f5ebf09e62d15acbbf428c3"
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
  #   zshrs-v0.13.78-x86_64-unknown-linux-musl.tar.gz  sha256: 7b2f89caf0d2d5584e1847c197ba433559cb074d6e5a49379663dcd44b168547
end
