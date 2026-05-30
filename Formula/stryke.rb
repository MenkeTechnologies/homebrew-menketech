class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.5/stryke-v0.16.5-aarch64-apple-darwin.tar.gz"
      sha256 "02a849559718640043fce1d487c449e9ab69fbb8bef78af0cb6fdc250387e4f4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.5/stryke-v0.16.5-x86_64-apple-darwin.tar.gz"
      sha256 "686c48b5c0ec185f76e8394e348f899300f8c8312237da98f15170af72c7ea70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.5/stryke-v0.16.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.5/stryke-v0.16.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "558a14d52090b9dca437b2d7a1f2758880497432aa93a6f2ab1a29aa205d6ddb"
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
