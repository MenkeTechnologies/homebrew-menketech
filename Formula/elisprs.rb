class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.11/elisprs-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "ff5d4d836dc4266f56f3d2b9c649f95d437fc652f102da907b7c68ee872a5239"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.11/elisprs-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8156ca69c370dfd9db135e0c923bf2d68eb9847482c65b63905d22f59de18343"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.11/elisprs-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab500562e27e286bb04194c11dfee00e642d4cfedd8209cb6a8dd5dbfe07022d"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: 42f58ceb2de07f75f80f5696cbb6137f8d4a18afab78165802b8c6017795ea9e
  #   elisprs-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: c206232e9a416ecffcf718bef3a45a5bb88f1f63678338a1188c2c12d826010e
end
