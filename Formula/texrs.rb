class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.4/texrs-v0.6.4-aarch64-apple-darwin.tar.gz"
      sha256 "cb8de63baf70b4f40d1839cd5016e81767d1d69e14e76023262304a29ecbcd75"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.4/texrs-v0.6.4-x86_64-apple-darwin.tar.gz"
      sha256 "f9c1f2deb7857260ba03de575a2439dbdb631bf9992ffbb2cf00730395f1ee6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.4/texrs-v0.6.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5580db055526d8693050118e65565e5bc18e0edaf5445a9cac5d8ac758f9f2ab"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.4/texrs-v0.6.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70d6673ce0ba3461ce010dc2e389f68eb6617b754324577982639b729fc34262"
    end
  end

  def install
    bin.install "texrs"
  end

  test do
    assert_match "texrs", shell_output("#{bin}/texrs --version")
    (testpath/"t.tex").write "\\catcode`\\{=1 \\catcode`\\}=2\n\\message{hi}\n\\end\n"
    assert_match "hi", shell_output("#{bin}/texrs t.tex")
  end

  # Static musl tarballs also published at this release:
  #   texrs-v0.6.4-x86_64-unknown-linux-musl.tar.gz  sha256: 77b465eaa68d43daa6df57a37f653d7a35bb41cf7b2536014f494934efc73564
  #   texrs-v0.6.4-aarch64-unknown-linux-musl.tar.gz  sha256: 87a6e4f24ce7a2ce0bf49c0cf489e8f3e3cedf92d32a40ff0570ffde8c89099b
end
