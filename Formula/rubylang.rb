class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.14/rubylang-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "76d4e862b90f53be2d44a3a822c537454d53b3b8e4015aed75e8d6e878d65ba8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.14/rubylang-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "810e9da0d6511d257f3349bf32b7b75adca4e007ced8d53c5773ae210401b5c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.14/rubylang-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8df855f553b80148c41198d6b79a3df56dc8d396e950b24b93660da1d57bf61c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.14/rubylang-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f6606a81ebc8379bef1431556112d1fa290e0e7a0bac19e1cf01d7d4727d001"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end
end
