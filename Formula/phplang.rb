class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.10/phplang-v0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "ceba69e9a8d80c1905b8cf440f36f3c767dba24ce4288abc2bcd2755d1a771ae"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.10/phplang-v0.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "1050839e506e4658a4fa7907013c6ad9420e0ab475208385244717a8f157112e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.10/phplang-v0.2.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "506a9cb30e928e303314fc4fc856860101b85932211d9ebb18287dd340266a3b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.10/phplang-v0.2.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "daff258e1bc3f1f390a36c83995cd0fcc9dfa157eab3a28cf776d457e9a78289"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.10-x86_64-unknown-linux-musl.tar.gz  sha256: db4c129c40463381457374f5da3b35bd5e5f37e96853905ffaf2452dbd14d502
  #   phplang-v0.2.10-aarch64-unknown-linux-musl.tar.gz  sha256: a50597684acecf07dfa87b620591f8994749625f4aec4b5f17aedd376b929300
end
