class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.14/phplang-v0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "f6791d2fc0aa18550078456c7915d0ca50c5a50b13c99e1b604e259dce2712bf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.14/phplang-v0.2.14-x86_64-apple-darwin.tar.gz"
      sha256 "f7085d63d41716f51477bd35298d7faa242fd6c235683236876d6f6b4010caed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.14/phplang-v0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45e7fe40ae32f63526c4f4e4ccd52997e010d187ec8351e90f8755f9be728960"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.14/phplang-v0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7173a7832dcf8bbf3f0e5971887386b98040baa44cc0aa757d2639401a3d4c4"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.14-x86_64-unknown-linux-musl.tar.gz  sha256: fc599db8a48de2d0159f79800aa1dea854b5afa5e4bdfc811cbb2c6e922562aa
  #   phplang-v0.2.14-aarch64-unknown-linux-musl.tar.gz  sha256: 855a27f1efda4f7d8e1130fb3f120933956fd653cef79e0c17f3c73edb6010af
end
