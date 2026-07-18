class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.44/stryke-v0.17.44-aarch64-apple-darwin.tar.gz"
      sha256 "63347fa98a33ac412b47867f89a24310a42b8931b1828b0f7dfee961fe4bc2af"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.44/stryke-v0.17.44-x86_64-apple-darwin.tar.gz"
      sha256 "103eebad603ad97fcd924e9cc3a9faaac028fb4ef3e27a82f240a24f21b7b8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.44/stryke-v0.17.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6a9dac3ee094b0a01cf8efd2393c98e552c0d66795ace33fc4c40e6d534469a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.44/stryke-v0.17.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c929aefd957a30cf4d0401191f024c1e48e18aa95ce1dac28ab9458132328a0"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
