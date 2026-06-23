class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "396b040b067a0db8bfb5c712289eaa9de93ea44c8c56efbfe9cab2b83803b824"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "e9b79437846bac3b8676f96931e62d5b4ba5210c1619a742e8c8b52ae4e903d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-v0.12.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "555bdda254a22290cf6f444ca8eabada852ac6152bd573a0a74809a2cd1b4753"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.3/zshrs-v0.12.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6395acf745c1a8d17c3b4250069ab85ed77f31dd4adeac65d4bb15bb3bc8a27"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
