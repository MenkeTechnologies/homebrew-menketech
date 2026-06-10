class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.42/stryke-v0.16.42-aarch64-apple-darwin.tar.gz"
      sha256 "e0255bf0e51847c7ad3a4f69c7cb23ae3c0441f2386111877fc20f783fad786e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.42/stryke-v0.16.42-x86_64-apple-darwin.tar.gz"
      sha256 "e2b5a96fd1209b35df05af52039485843cae2b3df14927e57ec4ea0fd11369a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.42/stryke-v0.16.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.42/stryke-v0.16.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b63b9bbaf553e5d999222bc34e8d11ce2b7bc6c1feedc9c412b60b5be8f0681"
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
