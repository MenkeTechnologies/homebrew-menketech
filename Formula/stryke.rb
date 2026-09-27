class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.58"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.58/stryke-v0.17.58-aarch64-apple-darwin.tar.gz"
      sha256 "32e06b468f2f447c8a32e236129dbf887d11649ede9dde6c2be814e5a8da0445"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.58/stryke-v0.17.58-x86_64-apple-darwin.tar.gz"
      sha256 "655405cd45a9d3f8a35e66efacceb854bd0214b44676432e1eaa5722df1c373a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.58/stryke-v0.17.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21bcf7528edc08976ada495de5b56e249fea5992cb94ec4b01d076c3facb8242"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.58/stryke-v0.17.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6d5a0fb8a81c85fe4ec90a77a4beb32427b87571b44fea0695c2187e1514b30"
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
