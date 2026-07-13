class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.40/stryke-v0.17.40-aarch64-apple-darwin.tar.gz"
      sha256 "100cc92cfb0e40810385c8b8e1cc9c8af0415bca48c835745f6f5f3f581cfad5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.40/stryke-v0.17.40-x86_64-apple-darwin.tar.gz"
      sha256 "b208e1d24f656e679c36807ed73856799c293c784993f3f6e4eb3119487e58b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.40/stryke-v0.17.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe78401f9ba6d7dfe5ece98d8323142ffb7610aa8266dd5a887fb3440aac8d59"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.40/stryke-v0.17.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcb1f21f680d23ca7c8f57e5a26e8a7145a492eb8602bee97fd07077de314f8c"
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
