class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.37/stryke-v0.17.37-aarch64-apple-darwin.tar.gz"
      sha256 "49cecf492667f6a8ec6bf6a013ad03863ae0c76a8aa53f37b74b83d53858911d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.37/stryke-v0.17.37-x86_64-apple-darwin.tar.gz"
      sha256 "2252e3623753a079b655c1eff41d15b83390fb1930bebaa8d55e1b4c6cfbf5bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.37/stryke-v0.17.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c826570c3056886ccedeaf59946152e3f1c0b99b95bf132866f9064a46e16756"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.37/stryke-v0.17.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e011ee7a9eb76a3a9db85ca46de706e49c08f662fcdf01e8a43534accfe4ec43"
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
