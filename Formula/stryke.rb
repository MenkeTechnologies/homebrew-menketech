class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.23/stryke-v0.17.23-aarch64-apple-darwin.tar.gz"
      sha256 "6670f98e41fd6fe10ac8e8fd82977330df1bcb33ed116852491eaa0f0da34fda"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.23/stryke-v0.17.23-x86_64-apple-darwin.tar.gz"
      sha256 "9a92fb904f71af9f343c7943d962be70d37e5ed5f4f3a2325b209f60997ae911"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.23/stryke-v0.17.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.23/stryke-v0.17.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5698677b879532f99fe20203682507c17738cd22aa4dfa725ec29153af126c5"
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
