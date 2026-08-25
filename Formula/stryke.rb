class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.49/stryke-v0.17.49-aarch64-apple-darwin.tar.gz"
      sha256 "b428a55412052575e53f3a2cf8e890c6bc5433000f946bebb4f4d3f8cab71c1a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.49/stryke-v0.17.49-x86_64-apple-darwin.tar.gz"
      sha256 "a6f1daa2a9e7c55cc6738db5684c20571ccc20458c3942ed120459f4e1b943d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.49/stryke-v0.17.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33632522cc18b16dcc8f601a18f2a8c70e52008bdcb1f54b85aa6323b53654cd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.49/stryke-v0.17.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "837dcc01fd8fac96851628a9cfdc3fd7fbbe76a80d935f760a960230c93c397e"
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
