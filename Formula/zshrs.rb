class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.72"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-v0.13.72-aarch64-apple-darwin.tar.gz"
      sha256 "b2e6872def53fb24d2dd0c5d2e38fc173040b791ecec7650e504b8b534dda915"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-v0.13.72-x86_64-apple-darwin.tar.gz"
      sha256 "0862f3ff61e5bc278e8faf0561e5603db07102853cc68bb6598d8fdf10fb7c19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-v0.13.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92e63ce49e7b3709481c932365aa66497a9549f41ab8d5631c1001af2f64e959"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-v0.13.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80c8db7c9238f49f742c9b5a4020e4a452f365d2d19a6cbff649a522106bc8a6"
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
  #   zshrs-v0.13.72-x86_64-unknown-linux-musl.tar.gz  sha256: 318f176122cf53723b237c09c388d3708a78303e108ab508b061fad52d9074c1
end
