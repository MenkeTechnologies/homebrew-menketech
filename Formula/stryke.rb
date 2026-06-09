class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.33/stryke-v0.16.33-aarch64-apple-darwin.tar.gz"
      sha256 "43b6be342b06c851dac04f27abde1983fc4c13e3fe358879a633ffa5beaf9b82"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.33/stryke-v0.16.33-x86_64-apple-darwin.tar.gz"
      sha256 "7dbf14dc2a29e295b2297d39accc055c7a64fd44b44ca91fd69af1fe9d1a5b2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.33/stryke-v0.16.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.33/stryke-v0.16.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2dffbb4b465d8a7c56c994b6c389cb7fbd9486d096b9917daa899a2cc1008b65"
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
