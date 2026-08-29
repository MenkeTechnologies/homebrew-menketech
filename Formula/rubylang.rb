class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.7/rubylang-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "962a466dd0508a6c90c68d29bba4700e5f675b196e165865d1e5c1b2ee80b05d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.7/rubylang-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "36fe21b7357068e29665aa74714ab98091e3e0ec1f908baf020411db701e1ebd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.7/rubylang-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "308b3d10b122de9f8e2571663cc21fc2d5e940f6fc21f2218d15f2e98e82a1c3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.7/rubylang-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0db004a35189f6c9249a751ab5b5ff8d306d2fa38b63743ad909722157b56a31"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
