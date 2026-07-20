class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.1/arb-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "ccb3d0c65dada83ea1c5fe33e14072fb5ddfd81d5e2b845255f140bfd53383ea"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.1/arb-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "e91e775314a26695e363839853dcc8279e84566ebdf8f90cfb09d9c151eccdaa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.1/arb-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8ac337808f55cfe64ca8894d8dabdf027a2e317a2861c154404049c7a8e495d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.1/arb-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b6a7b0eda823a9a241e820fd94f3de0fe9eba4163d1dd2f4abbda2fe30a0da0"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: 0a9eb3d7ece24cdb3197adaf30996150996c44d87253fb1c30cd7b9fd5291604
  #   arb-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: b50bd6e33c496e2f2b8b035859c42bb9e4be72cd3334c93ec0d55889f4e6f5b3
end
