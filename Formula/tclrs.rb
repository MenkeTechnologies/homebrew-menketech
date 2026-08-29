class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.3/tclrs-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "e812e720db09e90cb10c0234a112fe41343b2052a29d1596f0df18d8ef43fd91"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.3/tclrs-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "d0c08607601f12895e5710164053251710d6277f6a933b22d36ec47c84908a3c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.3/tclrs-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d952e8cf6bc9ede21c4e12ff23bdf416be62b8ad51bb370518cfb8844663729"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.3/tclrs-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3096f777f9f20c64a58b26521a5e768ab35372a468416a05935ffa8b55c2101f"
    end
  end

  def install
    bin.install "tclrs"
  end

  test do
    assert_match "tclrs", shell_output("#{bin}/tclrs --version")
    assert_equal "3", shell_output("#{bin}/tclrs -c \x27puts [expr {1+2}]\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   tclrs-v0.4.3-x86_64-unknown-linux-musl.tar.gz  sha256: 5b1b541d246732332add0e21ff7681925f249274370fdcf5a20f2c8c00e08a40
  #   tclrs-v0.4.3-aarch64-unknown-linux-musl.tar.gz  sha256: 38ca319c8bdd204549d94b128896e2da75f7291ec40ed7083de32dc28f6e5dec
end
