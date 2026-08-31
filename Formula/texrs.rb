class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.5.0/texrs-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "4ed3600d8ee21ac71b1adb00fe7a30abfc6fb59afa1c63efd806d884b32494c2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.5.0/texrs-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a0ca9dda5e4af86715f245f139e9fa2f7cad04e2efdbbbce18bd5c209783391"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.5.0/texrs-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b80f48ef1e2fb8ebaffdf9cde9cc5c7bd1f3be893a607dd416abd42f35503e8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.5.0/texrs-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6608cc0fee30869ed59294f3114b6f561369bff96eaec7308a102026f3b6ccf3"
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
  #   texrs-v0.5.0-x86_64-unknown-linux-musl.tar.gz  sha256: 13e92b1855eb5056d9a324088110214a525efb0701c6c2b81cefa7556631b7c0
  #   texrs-v0.5.0-aarch64-unknown-linux-musl.tar.gz  sha256: 93a6f9d494f82448c244446dbf184283ba6b74fab757fb5b3c73f618e93fb069
end
