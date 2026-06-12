class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.8/stryke-v0.17.8-aarch64-apple-darwin.tar.gz"
      sha256 "a0cb21de97fcc9d29bdd00b55fad897ed964e926ce78f67559f1ab2a8c1e8ae5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.8/stryke-v0.17.8-x86_64-apple-darwin.tar.gz"
      sha256 "872e93ddbbe99a90b55fbef658af99a4b17e65f93353396c0cb685e1b077b9f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.8/stryke-v0.17.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.8/stryke-v0.17.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff565cecf91d3800df1afb9ca18af6ae3bc85eeaac3c39aea31826a5f041b25c"
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
