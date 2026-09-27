class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.17/elisprs-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "03c74fc3b7e718fc3d560ccb80409120147193e3365f5c8ea1696e623b6f6941"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.17/elisprs-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "065affdea3798862efff30eac7f43dfc51ce3f98010d8d1c8b2ff1aca6ac1e84"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.17/elisprs-v0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d8b0e961246271f908c7ae7f302a76db1737857f5865fdac7f0a8aa668cd1b9"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.17-x86_64-unknown-linux-musl.tar.gz  sha256: d66044b3f65ef0cf57256b74beea21c93215a340a3669e4b8c0daa5ee06f4bea
  #   elisprs-v0.1.17-aarch64-unknown-linux-musl.tar.gz  sha256: ee9b2b0e8e151806cb1674afa93004309d3f649d556fb8835682bf6387b3014c
end
