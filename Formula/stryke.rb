class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.14.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.14.27/stryke-v0.14.27-aarch64-apple-darwin.tar.gz"
      sha256 "544675c420ff3c38fb0fb4a9660588985507dd1d6e75d9e1e3ed3c13fb463ae3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.14.27/stryke-v0.14.27-x86_64-apple-darwin.tar.gz"
      sha256 "7480e33005db764e82946ecb727cc4856de86f5d4979f7cf4604b6a3e71d4856"
    end
  end

  on_linux do
    # aarch64-linux-gnu omitted — cross-build is flaky in CI;
    # tracked via continue-on-error in release.yml matrix.
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.14.27/stryke-v0.14.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e6839abe99e40da5ddd21edbc2d950e5315eb3494945e506d6f129437d059c1"
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
