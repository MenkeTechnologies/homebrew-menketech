class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.35/stryke-v0.17.35-aarch64-apple-darwin.tar.gz"
      sha256 "01e02a7b8338eb18077b85b1972ad6e184461153635382a342891b5e65bdc739"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.35/stryke-v0.17.35-x86_64-apple-darwin.tar.gz"
      sha256 "c72bd093ea4ba989c2ae97de232fb0b5e0bd76fcb9f416efe1967b5f0b669082"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.35/stryke-v0.17.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72755c3845df9921be5a8316a064f53eaa55d4defff2bd7a4ce849b0d56f6e77"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.35/stryke-v0.17.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e952a4522103d79667f04295ade658e0ee478212fbe380e04c2827d4ef50cb3f"
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
