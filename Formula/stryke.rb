class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.33/stryke-v0.17.33-aarch64-apple-darwin.tar.gz"
      sha256 "c6fafcb777eead0466a2f09d16f41386bf89b0ac27795b7270f58f33cc7a6fff"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.33/stryke-v0.17.33-x86_64-apple-darwin.tar.gz"
      sha256 "584e2fc3520de9f99fbfb61aa07f2994734b433da21e4172114101818fe6688f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.33/stryke-v0.17.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2bd8b4daffef66372da10881d5768150a1067e756d374f12f6321cdc18dfa616"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.33/stryke-v0.17.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "026dc3dc3a46556d97acb36e3c80bcd6875ae128919ec94dcc8ad746507ef297"
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
