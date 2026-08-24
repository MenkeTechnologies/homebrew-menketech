class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.5/rubylang-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "dc1980d57ca6c541d2775b693b301a3984b7e657e72baf09cb04db2cbb3be49a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.5/rubylang-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "ad54dd650dd81d699d86666d818bc4f26a408a59e3db7a3d227623d5c8f83696"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.5/rubylang-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "021bf8b2651007937d0d7c5688bad774e91d1918d5961e7469ff9b47010c9717"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.5/rubylang-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6b3d35959b89f7ca318f05299fc25c21f733a149e39d55ab031d825eb1b390b"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
