class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.18/rubylang-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "b5334087f3b95297fbf8a61c02a0c5780c4e9a13491f6c732fac7124ecc624ec"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.18/rubylang-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "a664deade342a757a69f2fd5818d4fad846fcef0a4050d529368e673691ae1ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.18/rubylang-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f713d1c5164fd33433d9ef960c100818aeb0892749054a8c15ea60b414c77486"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.18/rubylang-v0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83aabc774d63e242ff50f6a8fb77af192318c834954c8d1f76fcb2bd053734d3"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
