class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.45/stryke-v0.17.45-aarch64-apple-darwin.tar.gz"
      sha256 "9e660d6f763d0e4b94cf9518af3aa666c1d640cb525231c504c2314129df4f07"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.45/stryke-v0.17.45-x86_64-apple-darwin.tar.gz"
      sha256 "66acd6ee650180e14a9cf961d53046dbcba54c002fbe3a250652923f5ccc5164"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.45/stryke-v0.17.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "989e9f1cddf23641af98f4ccc81214d3916530a06766955b7e1b149028e48005"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.45/stryke-v0.17.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "156d4037e9998083483845389bc0301173b14b2ad7e0c246b01cba55cbb76a25"
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
