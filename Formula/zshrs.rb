class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.51"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-v0.12.51-aarch64-apple-darwin.tar.gz"
      sha256 "3d01fd19ff1e5bfb8fbb900c5c19413d3fa8e4becb9f7f73141bc08b22a55e15"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-v0.12.51-x86_64-apple-darwin.tar.gz"
      sha256 "9b6b70fd7144f83791ca954a59e78395927da305a0c579d2e990a8313f1e0bea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-v0.12.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90713201b29fca1fb273f48d21423e8acf1f4d39c0cf7ae3f74aee8f20a10fb0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-v0.12.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bbe33174be8b62abc47acfedc58cce34f851bf270fca710d99b69d28bfe6a7f"
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
  #   zshrs-v0.12.51-x86_64-unknown-linux-musl.tar.gz  sha256: 5ec3ac051458b62c714d91fc25142573b6015840500655bad333d9dcca9e3ff2
  #   zshrs-v0.12.51-aarch64-unknown-linux-musl.tar.gz  sha256: 0ccc93d50f7ba2856248f473399a90e175451dae4596d873089532f4765258ba
end
