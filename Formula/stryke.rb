class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.10/stryke-v0.17.10-aarch64-apple-darwin.tar.gz"
      sha256 "63923ce94495bef00af57a9b8ab9352226cb1edbe136d58f00621f99a5e6fe05"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.10/stryke-v0.17.10-x86_64-apple-darwin.tar.gz"
      sha256 "e51678285881c21165e3195de19dab728f4e30a24171c4781415aa121ce9edce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.10/stryke-v0.17.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.10/stryke-v0.17.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e47bb2696ab7360d6d659e860ef22c85c665ca3556eab5e5667a2242496a4d5"
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
