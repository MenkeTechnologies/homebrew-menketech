class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.25/stryke-v0.17.25-aarch64-apple-darwin.tar.gz"
      sha256 "92b761cb0d53835210325d4cb9ae864380bc41a79b71736fdbf2de8835b4bf76"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.25/stryke-v0.17.25-x86_64-apple-darwin.tar.gz"
      sha256 "987b72fd1d7841f26087caee47ddb3a857ac77a8a222b76480adf955fafe3d73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.25/stryke-v0.17.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.25/stryke-v0.17.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ce7aef5ca2ef6c6bcb2f3a26992ddc0ea9341c4d0eb8cbe9f7d201c31714576"
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
