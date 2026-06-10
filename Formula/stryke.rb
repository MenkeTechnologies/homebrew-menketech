class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.1/stryke-v0.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "2c5c8bf01f661d2fac9de0ed32c0cd94658df156f9e2d8aadb90afe939a6a1ed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.1/stryke-v0.17.1-x86_64-apple-darwin.tar.gz"
      sha256 "c583941404b2eb8486511a44445d5803e4391890aa7383e270d02860b54ed0c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.1/stryke-v0.17.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.1/stryke-v0.17.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01c2b7776b482da585ab95ff6371836399d96a43fe5c9efd06d4ed150a98564d"
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
