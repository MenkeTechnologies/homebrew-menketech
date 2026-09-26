class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.15/rubylang-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "bdd6390d8581b7233953a3b085ab5f8053cbfe540077459a7230b772031992d1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.15/rubylang-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "e7a8df9ef254c3c8ddb9609b62255b5e536f3e15b64644473d4ed1b92271cd56"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.15/rubylang-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33740e50760412320ca0f250a69b24cee5a100d1d67e8d4e8a2e6dbd000e33e9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.15/rubylang-v0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63df9f41adc31d8a4d7019f98c9771e0a389122dfcda5b3db9e31826edf3c137"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
