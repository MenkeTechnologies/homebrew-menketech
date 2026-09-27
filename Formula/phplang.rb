class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.13/phplang-v0.2.13-aarch64-apple-darwin.tar.gz"
      sha256 "cbcbc8fad1ac43b35705db04837469f1147c26613ab613c85f61d5a783fa6b07"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.13/phplang-v0.2.13-x86_64-apple-darwin.tar.gz"
      sha256 "442f4b3e73ced6a9c0d0a893804efeffb0514a966c3833c8031607b7d3dacd86"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.13/phplang-v0.2.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0820e41baa066bf827aa27e0b8d3dcfe2637ff108f94414a8195e188d40f7e1a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.13/phplang-v0.2.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42f463a0177c7b6755c3f477e26abeca7fd62785a455ea441e787794d01bbfd8"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.13-x86_64-unknown-linux-musl.tar.gz  sha256: 1315eab742756a54c37b062cdea459bce645b86430bb4334c41859d79cdfd191
  #   phplang-v0.2.13-aarch64-unknown-linux-musl.tar.gz  sha256: 08218358a87ad1a2f5a0e0dc2afdae0d04db5e54371a18a5c0e11e740a3e3388
end
