class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.19/elisprs-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "99a7746db42e6a415aca2397e4dbc825cbc47e134bdbcc70fa193476b0e4b732"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.19/elisprs-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5831a147f9c0c84f4d272002b43a6630489edf89dcc0a9a607caa58138bbcf8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.19/elisprs-v0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad7e56cfecd978247c7e927f5127c53e6b048ce94229524e83823746185076ca"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.19-x86_64-unknown-linux-musl.tar.gz  sha256: 8ec73dab0cb1d563562eb6fcaa1203746660974edb234cddfca48368b8be3df2
  #   elisprs-v0.1.19-aarch64-unknown-linux-musl.tar.gz  sha256: 2d467b08219158cc0ed65f0d76a4730e3bdc8a5176c2b128e360768318e828fd
end
