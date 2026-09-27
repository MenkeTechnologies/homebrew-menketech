class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.18/elisprs-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "676fe8ce584a2554bf71196e4837e48a39a9b50fe2404161fd3c99011a85e894"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.18/elisprs-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d29737f2570b2120cd2c981e7d04a68d9322c0f8b9afdd89e12346f307055eea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.18/elisprs-v0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b2908f2fedb4e0e3126e8bc6a40257c49b8a2d538c124af3c4753d38a07b958"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.18-x86_64-unknown-linux-musl.tar.gz  sha256: bff30b7a181d62d1b9b998849bccd98214465369925e23cd06de51707a4b7ff3
  #   elisprs-v0.1.18-aarch64-unknown-linux-musl.tar.gz  sha256: 6869df3cdc5dce70d0c0f3c84ef7eb9920f872381b6a51c48f0317aba0f92eb4
end
