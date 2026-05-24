class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.14.24"

  on_macos do
      on_arm do
        url "https://github.com/MenkeTechnologies/strykelang/releases/download/v#{version}/stryke-v#{version}-aarch64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/strykelang/releases/download/v#{version}/stryke-v#{version}-x86_64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  on_linux do
      on_arm do
        url "https://github.com/MenkeTechnologies/strykelang/releases/download/v#{version}/stryke-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/strykelang/releases/download/v#{version}/stryke-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  def install
    bin.install "stryke"
    bin.install "s"
    bin.install "st"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e \'print \"hello\"\'")
  end
end
