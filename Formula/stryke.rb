class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.3/stryke-v0.17.3-aarch64-apple-darwin.tar.gz"
      sha256 "0802ef2f18f77441b609525402721d5524092aff7c1dd5a37e577b904d05ca51"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.3/stryke-v0.17.3-x86_64-apple-darwin.tar.gz"
      sha256 "cfee2ca1c3e534669c58cbe4dfa3492a8589a62660b067f976938a03d5e4760d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.3/stryke-v0.17.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.3/stryke-v0.17.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ef4d02ce44c7c82bdf1ad620847eb5888ee608631fd20b7c3a7f7e7c3d28cf1"
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
