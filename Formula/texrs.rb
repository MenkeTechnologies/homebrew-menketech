class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.2.0/texrs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "39ce2354e5303b61211defc3755bb7051a9ef33f64bcdb60317bc40cdbcaa8d9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.2.0/texrs-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a290b0ab1368a23cf7815f9e894e37eb4ee92107761c4e98e73ba968ef2f73dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.2.0/texrs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "993bddd17b88cb65636a062af495ce1e61f59848f47701c1bab08971ba49bd91"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.2.0/texrs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33918a1ac9b6fdd31a6099e054baf01d761989a6946f0c64a6d0b0ca7a33f312"
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
  #   texrs-v0.2.0-x86_64-unknown-linux-musl.tar.gz  sha256: b3d3f7572c17a86b63d2ba971099b2776d8e1816f03798c0237cc00cdddb7a66
  #   texrs-v0.2.0-aarch64-unknown-linux-musl.tar.gz  sha256: 1e31df1619bce6eaf19abd7bbc472f4a0ad7acb18788b4935e731b6b1f9c62ec
end
