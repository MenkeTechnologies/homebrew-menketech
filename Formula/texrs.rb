class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.4.0/texrs-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "052798f6aab87bd4729483b05ab22560ca1e1fc325382fff83da9fd5c77bf6a9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.4.0/texrs-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "264f472d01501558d87f5d389ab36b3c2fa249294db725d426f63726e4cd6194"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.4.0/texrs-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fd85fd7067afbca67d924b0a61d501c6a1d9d65468f9f4345ca62934eb81170"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.4.0/texrs-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50e6f5f04240ed9aea4a1b403685add1536b646847fa23f76b6a1e31dc717207"
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
  #   texrs-v0.4.0-x86_64-unknown-linux-musl.tar.gz  sha256: a06e114c09217ec6141c1dfe6234ec9319ffaeeb5737dd5b346f9c2bcab4bdbb
  #   texrs-v0.4.0-aarch64-unknown-linux-musl.tar.gz  sha256: 7cb9267f2149cd09d54c7b562264c631bc8190324195edeb67d93926bf53c09b
end
