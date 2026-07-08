class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.3/vimlrs-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "3dc2cf408725ae9b0c28e50fcb9fdb8947a5e45e91461ca4a46db6d6ae2ffbea"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.3/vimlrs-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "e634c088d988b9785be21fb67a5d5a175aef4570581dd7a5f487af8df35e0a7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.3/vimlrs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b6512c5af9d4172c01a83ed14e05751e06380753fe8f48b261e8bd31f9ff10f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.3/vimlrs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ec5d6a1125c0e192b3c220e3343b79df958d00d9982fcfc18e868f243b3d6d"
    end
  end

  def install
    bin.install "vimlrs"
  end

  test do
    assert_match "vimlrs", shell_output("#{bin}/vimlrs --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 49115c8e3b81ad417b4bbdfde5abb46dcff5893e3548a3afc57c3171d28d6e9a
  #   vimlrs-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: cba9ca6945b94dd40e18911e87f421a73875f196aeb5f02e9939f1144daaee4e
end
