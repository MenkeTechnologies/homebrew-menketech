class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.9/stryke-v0.17.9-aarch64-apple-darwin.tar.gz"
      sha256 "2125c7e25190a431267eb0b6cd868796784910e2639f127394fafcd84f2abbca"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.9/stryke-v0.17.9-x86_64-apple-darwin.tar.gz"
      sha256 "9b33138310b3cd8798f00069795ab0f5baf1966f065581b80d6d3bc4ffde0cbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.9/stryke-v0.17.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.9/stryke-v0.17.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f81fa0350eca5c0d7418f69c630f4bd96b40743abe9cef302c9afe0ebd7f74ea"
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
