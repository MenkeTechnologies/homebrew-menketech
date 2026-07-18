class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.1/rubylang-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "a77311953d8c10ae494f58e32fc0386612769fba491b91b29747f02241cb2425"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.1/rubylang-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "c618c0f105317576dd61859a798302e01974555c1cfc940e843748d793b630ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.1/rubylang-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0f212eed0b9eb30e6cbff06fde4dc9fef3ef27274d5f5161bd47aac2fe68174"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.1/rubylang-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81e56507e66d8f947c7f9a132b715329f4828a25de512b9f11b7058019a122e6"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end

  # Static musl tarballs also published at this release:
  #   rubylang-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: ba182e8b7634197938ffd2a0d9f6fce601f80b5a1d332776f6c3263172be1804
  #   rubylang-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: a040ad0e183ed84d2e895ce93df46a82358be1d7daef420127bf0c3ab54969ae
end
