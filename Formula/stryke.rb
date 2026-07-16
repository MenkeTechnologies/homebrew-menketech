class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.42/stryke-v0.17.42-aarch64-apple-darwin.tar.gz"
      sha256 "decb8b8ad797a8484ca7283a7501b9ef6c011bff9eb10491c843f15f57f241a1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.42/stryke-v0.17.42-x86_64-apple-darwin.tar.gz"
      sha256 "f294646bb2d513aec31a945713f951f7c597f315b3b43c907f6420fcb70f7e99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.42/stryke-v0.17.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26ddad6df201691d41ac62176b32338afd6b0e0c9c715ba0c2eeba253598e3a2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.42/stryke-v0.17.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de0450808614c660ae6dcfd8d10bb57feb2f72b952b298790b8e36f8a21663f1"
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
