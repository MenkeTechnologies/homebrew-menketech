class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.11/phplang-v0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "7bc9392938edaf1023bd3cb57aa5aba040fa702edc10fa1480b38f06406ca201"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.11/phplang-v0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "e81ff9206812201027136ea8816c458976e0aa9ebc6fc36637c9bb93bd50f356"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.11/phplang-v0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "668e0c4e3cb631c7cc3d523e1243268a5cc2476fabe87b56998996f7cf3d833b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.11/phplang-v0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2f564a65c2f2de4b6a13fa0651431851245cd3d8cbf707b7c129e666ae79fd0"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.11-x86_64-unknown-linux-musl.tar.gz  sha256: 09b5e0d01c90b41467e14a6de8eb872973308c88d88ec551ff5c0bfc8c0978f9
  #   phplang-v0.2.11-aarch64-unknown-linux-musl.tar.gz  sha256: a6ea048b2410fda34c71b2834a6e31ad5e2a90558ea68f25964fc10a396247a0
end
