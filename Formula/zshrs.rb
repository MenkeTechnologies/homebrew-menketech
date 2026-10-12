class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-v0.13.34-aarch64-apple-darwin.tar.gz"
      sha256 "02b9af449e6d6ad1f3a09a3866eca703feb7fcb20c436e76db973896d8b1a7a4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-v0.13.34-x86_64-apple-darwin.tar.gz"
      sha256 "d485168e2cf22ecb1ae1ff39816dadd09138cba2babc6692817fe3ef02c6c5ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-v0.13.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5e7eba616c668c29f4c88c34d0d3890e74fc667e173ecb00a60a1e87903779d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.34/zshrs-v0.13.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a89559dab12642217114ad769d5be38b534ad1af9cb4dc655040b9ef9a627f2"
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
  #   zshrs-v0.13.34-x86_64-unknown-linux-musl.tar.gz  sha256: a4ac5d53abc0457e2224fd832b5c5e07d05230efa8799e3b966d3ac55591dc9d
end
