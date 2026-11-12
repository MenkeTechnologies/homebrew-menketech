class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.16/phplang-v0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "5ec9e191fb8cbe87ae1fed82170a5eaa01bb8ba95f0513e338a45985b14ed6a8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.16/phplang-v0.2.16-x86_64-apple-darwin.tar.gz"
      sha256 "333e9ca5d7fb3072362fa4164e6797e17c785d259ac6395c0e2e882b7c23c9da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.16/phplang-v0.2.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ebdfa9a5a2ed620a94caa1c68d2693527ec28a10007aee13353ba699f1c5147"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.16/phplang-v0.2.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4642cc597eb27d91cdaf0e81387d76eaa81235cbf952983c78264443bdcd6f1f"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.16-x86_64-unknown-linux-musl.tar.gz  sha256: faa49fcb2ff4592508736fcc7a62e634c59c6c217446136edb59d20bc3597f57
  #   phplang-v0.2.16-aarch64-unknown-linux-musl.tar.gz  sha256: 6ac96010d672acb1833ee58b9fb3a41da5e4f128ad6a837a5b0a6705328f9758
end
