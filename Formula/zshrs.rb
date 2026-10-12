class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-v0.13.36-aarch64-apple-darwin.tar.gz"
      sha256 "073d8730b67ba9f5fa81fa32aebb9972913dc60c48fa5a24d3baf4954e7a18cf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-v0.13.36-x86_64-apple-darwin.tar.gz"
      sha256 "4c90ab1b8bcd2e12a321c893e8af3c73f346050aade602b16670ac188feb4ce5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-v0.13.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "905832b9377f5b1788cb2671dbbe45aa882ecfd078cf62c808a84f50cc42cd4d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-v0.13.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26adefbf79a642c0fe51c3e9fba8d8b89e1e4097d5457d81e332b3dd2d980902"
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
  #   zshrs-v0.13.36-x86_64-unknown-linux-musl.tar.gz  sha256: ba80ba6d57d65c753f53408d84c76bcffc25d716e6df1f7fa2faf18c0efe98e3
end
