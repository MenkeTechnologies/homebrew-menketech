class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.53"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-v0.12.53-aarch64-apple-darwin.tar.gz"
      sha256 "f2c7fcf9635b3cea96b7a246b8fd82eafc870aaa4e69a9616d69de5519338ca8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-v0.12.53-x86_64-apple-darwin.tar.gz"
      sha256 "33e35cddd1b6dc7c798cbfe8ab3a7bfb6a0f358bbf6a03ccd33da7b3ef4d70ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-v0.12.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4f83666b13c610db86d144528fb0816e187878757c038036635aee3bcb07b63"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.53/zshrs-v0.12.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa9eb734000a7e882a945360557ff60e3fd707f13ab7b5d17b8f103a579e7ebc"
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
  #   zshrs-v0.12.53-x86_64-unknown-linux-musl.tar.gz  sha256: 6434935d59ab17eb3d3484b15a5b14532251232d2c6005a1171821518469ba9f
  #   zshrs-v0.12.53-aarch64-unknown-linux-musl.tar.gz  sha256: a2257c311c0f6fbec700e07206701aaddc7b8365ae96c348cbe335c790801c3a
end
