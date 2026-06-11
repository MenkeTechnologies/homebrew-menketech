class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.6/stryke-v0.17.6-aarch64-apple-darwin.tar.gz"
      sha256 "81afa36240dbed53a2dceca58cdc6b0d5420d0b23607e5634845081bf031c5a4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.6/stryke-v0.17.6-x86_64-apple-darwin.tar.gz"
      sha256 "00094daf07bb2ea651dbdd75d15f0bfccc56419ac33020c4aeb212c259c9f0d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.6/stryke-v0.17.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.6/stryke-v0.17.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6434965ca8013555bba83566751fe37b8163b50fe03c742637c9946937513180"
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
