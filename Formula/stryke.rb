class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.29/stryke-v0.17.29-aarch64-apple-darwin.tar.gz"
      sha256 "21442c0f0d30075d38c7f6be1d6e88b81430ba1bb428daba2531b5cef856b263"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.29/stryke-v0.17.29-x86_64-apple-darwin.tar.gz"
      sha256 "6b722fe7827f16f97bc2ada19c0e64ec6a31e52c6cfdfc0166c3873da6040e5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.29/stryke-v0.17.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.29/stryke-v0.17.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1c74a8cae57eb9347c76257c269b92aa15fc9d6d39b3c3fcc3433c553d51041"
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
