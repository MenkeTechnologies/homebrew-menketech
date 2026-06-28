class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.1/elisprs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "d9c89aff227548a1d4df86b466407e5565603a3e27b9272910fa180de2d83355"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.1/elisprs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed0bb61073f0fdba373872ff00a6094d335f8dafb76cc6cf1584d959e4e92a40"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.1/elisprs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "629a26aa1276c56bd10651e80743056dfd0c07048838fccc1744615ea92a47a9"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: fb207bc1fba511f0f84cb61ec626e347dce2eb2f3c73b15f4a049e6631c5f9d0
  #   elisprs-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: b1bda951096682101a05a7f3b7edf6468fc8d3b4c322c0ab72c22c8d7c6726d5
end
