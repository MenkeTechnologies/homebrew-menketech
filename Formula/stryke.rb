class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.2/stryke-v0.16.2-aarch64-apple-darwin.tar.gz"
      sha256 "0502f116367bad51fb3fc07ee8ef1154c9c75d397291a162bd2c08f22b1db3fe"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.2/stryke-v0.16.2-x86_64-apple-darwin.tar.gz"
      sha256 "9b354766d9f27130262b7a1f6a5d770a0f59b93cf0e371408c3276ceeff84c3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.2/stryke-v0.16.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.2/stryke-v0.16.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d5dc075aa392005865fe7feb3928cf451c4944bc712c0ae077c57f8e1795de1"
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
