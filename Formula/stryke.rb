class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.1/stryke-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "773b47f0355456b893d3d88c838c7e81be20124d7b916b2e7b66b68ff01e5496"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.1/stryke-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "7c7b2f375cfaa032d7bc722e9f6e95a2ea445ebaeb665631bd01b8974a519c4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.1/stryke-v0.16.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.1/stryke-v0.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1144109be621ac4beae57c849e2bc7676f99b33de2686676a619458793fd982"
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
