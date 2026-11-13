class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.7/texrs-v0.6.7-aarch64-apple-darwin.tar.gz"
      sha256 "4f23dbc266d24661db0f43573bc7a520a1769b9576359beaa8d40ff6965cd641"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.7/texrs-v0.6.7-x86_64-apple-darwin.tar.gz"
      sha256 "56ac0c31e6c0b9bc5ae940d48cb52ee61cdfae1d1a5cee0b04d7610957bd235e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.7/texrs-v0.6.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c27dcb4f53d63ff2020d54f529e35f06d9829fc5dca809e2632a05b0f824102"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.7/texrs-v0.6.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3205854003ba0336f478fa4cc059f8ce77da4b6200507cda561fe4f7ad8b2d53"
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
  #   texrs-v0.6.7-x86_64-unknown-linux-musl.tar.gz  sha256: 9228b58d4c0fe5fbdb3762a84c713a0ab68edd07c136820039c8174c5dec688f
  #   texrs-v0.6.7-aarch64-unknown-linux-musl.tar.gz  sha256: 41d965b1a866840faaa8eb0b1b1bfae76dd96c63916bc8419f640babd13fc8e4
end
