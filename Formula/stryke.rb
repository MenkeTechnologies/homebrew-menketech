class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.31/stryke-v0.16.31-aarch64-apple-darwin.tar.gz"
      sha256 "35d50aae4380ab443c04cc1917ad01c4f60022343e8ef22223c8cb74016fe82e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.31/stryke-v0.16.31-x86_64-apple-darwin.tar.gz"
      sha256 "c491789f0dd40a46165a385bf1f8d7032076a33d8880134d4f43d30a5cb5d1dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.31/stryke-v0.16.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.31/stryke-v0.16.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d32a3558b25da21667722f21f4a992ab7b41d5ecd2d067ca597e135f93fc0d9d"
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
