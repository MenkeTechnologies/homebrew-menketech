class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.43/stryke-v0.17.43-aarch64-apple-darwin.tar.gz"
      sha256 "a44654f329d8b5debd372ef61aa511fbe315c891f3770dfd54fae7aa7f225478"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.43/stryke-v0.17.43-x86_64-apple-darwin.tar.gz"
      sha256 "8e91b9b80961e0acd6add16ef2a48dc54a245d2435487e65e9d111e4cd7b06ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.43/stryke-v0.17.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6e0b05409659ffa55543dc3fa7994561b6190782f70216ef20982f3f7c90e7e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.43/stryke-v0.17.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a530cf8e8c39e611399e511583912ee9f2f1a4eabe0825fcccd0d065b007f69"
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
