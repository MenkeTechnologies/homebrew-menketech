class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.4/stryke-v0.16.4-aarch64-apple-darwin.tar.gz"
      sha256 "6074de267214dd01cd7f9d36d4f75a77ce8b68fe65b013969349cc0d4b4c8b51"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.4/stryke-v0.16.4-x86_64-apple-darwin.tar.gz"
      sha256 "9b4217f522b22d3065256a041fbc3fc3e36efda3e035cadb575332967a34d6c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.4/stryke-v0.16.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.4/stryke-v0.16.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cde735065b2610c3c7d683f360a8f3577261feb581a3bac4e29c0fb709cbd2b1"
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
