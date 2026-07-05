class Elisprs < Formula
  desc "Emacs Lisp in Rust — lowers .el to the fusevm bytecode VM"
  homepage "https://github.com/MenkeTechnologies/elisprs"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.2/elisprs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "cdab40e79bc1bf6bb440e39a40cc54c07ce22fbd52bff59a650ca78ff1b99ec5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.2/elisprs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "270a1b272dbab022fa013467d5b32fbab110abcdf5723246b7e95f8487f1fa2e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/elisprs/releases/download/v0.1.2/elisprs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bd31e799cb82ef5038f42e153b10b330d9d9445aa60fd83f9cce09c0588ddb4"
    end
  end

  def install
    bin.install "elisp"
  end

  test do
    assert_match "3", shell_output("#{bin}/elisp -e \x27(+ 1 2)\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   elisprs-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 1369bc33c3ef8eaffad5f17dde6f06037e2d4d3487716916be1e3bac031c04dc
  #   elisprs-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 317eee52ccdb7f7eb8f1370933ceff93f3465edc48ae04b2c58e2556448858c5
end
