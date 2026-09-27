class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.16/rubylang-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "66e379a54a5daab955b371b853449e71eebce8c3c1990868cc8b410c588e11b6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.16/rubylang-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "51a14cc0f24594f6fa89381e82553c23faf47afe4317784112e810aac1daf3cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.16/rubylang-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e6cc7f0e6f8e86bad35e7f2ebabd7403e8629c21827d8189f9078084b1cbc36"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.16/rubylang-v0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61013e8d5fb3f9058a2407512377ed9b268b7151d40e193dbecf3f3943b0ad90"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
