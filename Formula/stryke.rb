class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.36/stryke-v0.17.36-aarch64-apple-darwin.tar.gz"
      sha256 "8ec47371e93ceaf982ae6b47055fcfecfaf40c89698fad91e964f38bee890d07"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.36/stryke-v0.17.36-x86_64-apple-darwin.tar.gz"
      sha256 "5c47be367eb8b6c2b25dbecd3a61f57caaf64cbb7bb2f16d1617125475106b97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.36/stryke-v0.17.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e9949ed9e3d5d9e787e255013876af54c566ba5f84a1e310038a3b00a4b7e39"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.36/stryke-v0.17.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b4de5649e2ece1b9a9cc4d3e9fe55303a1f66297a133f7e4518b288b7299faa"
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
