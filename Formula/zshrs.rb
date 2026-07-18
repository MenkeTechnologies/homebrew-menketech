class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-v0.12.20-aarch64-apple-darwin.tar.gz"
      sha256 "d505062e4b94de3d887a168335d384ab8003e7995f9d3158661b9bfc8d1de032"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-v0.12.20-x86_64-apple-darwin.tar.gz"
      sha256 "aae7951f79ad7f42a58abfd4a56a0f5ef98b2d0c57a812c853b67f6b18e8b9b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-v0.12.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "affc87494baca09af6980d2ac6ac0d216cda82ee5a68a39c5d16475ca1888629"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.20/zshrs-v0.12.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec933ece4d35cf8befd4b83704f967b33c6a396245f96560971e677ae7a67c6e"
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
