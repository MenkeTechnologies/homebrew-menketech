class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.36/stryke-v0.16.36-aarch64-apple-darwin.tar.gz"
      sha256 "bf23f9815913d71d20c1bb6fefe99738cd0ddfdf643e2261e6dd21f3e2ad81ed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.36/stryke-v0.16.36-x86_64-apple-darwin.tar.gz"
      sha256 "d9ac53aeee4a5177cb5a425b79c52d0954fd8b39504779db64569a15efbe8080"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.36/stryke-v0.16.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.36/stryke-v0.16.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17efd6d48792ee8759c63c3192cd6722a78fdfc5e261e56ad1743a07ca299e7b"
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
