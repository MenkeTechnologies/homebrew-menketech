class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.8/elisprs-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "8f3ea9000ce364b754427ad105f551da2f2544098ee6abc1cb61ab1a711f0609"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.8/elisprs-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e363e06dae72d4e53fb95d9e11a3c55ce7d80baa7c2071511d98dac6cd07c762"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.8/elisprs-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b527cd74ece2271a2df2a7d8c9f105dd2a8f9f1b08f82b238482e9810ac45bf"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.8-x86_64-unknown-linux-musl.tar.gz  sha256: 9cc5eefedd421de221bc7160ed4b6c5ed0e2809ab8b66edf043d617156784e15
  #   elisprs-v0.1.8-aarch64-unknown-linux-musl.tar.gz  sha256: 926804a9c9c61b238c02d421b8c62bdf7dd1a45e459e363d8a7c0407c0d74219
end
