class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.17/rubylang-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "fb46328927bb52303aa4720157050aba8156dc8976ca5b9af01b9a64ff8e2077"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.17/rubylang-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "90b151fe75813883d70bba7a5b36299c0ca9b5e50547a193659cc1901b72e76d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.17/rubylang-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b349c92b9cd0ef94f4a189e7e41925eb4f9932557ae9e62ff572eddf11584b89"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.17/rubylang-v0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffab8beee3381318e0d9a8d79d9568ea9efa63856fc36261ede81010d3ce4312"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
