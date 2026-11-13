class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.8/texrs-v0.6.8-aarch64-apple-darwin.tar.gz"
      sha256 "0d2c9be9f36028f9e64b8c28b46bc1ad4d813e42f2b850bb8f59c598df6051cd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.8/texrs-v0.6.8-x86_64-apple-darwin.tar.gz"
      sha256 "a6ca785d6d322cb29dea5cc6ceef164b1ad6caf468f47abffc02f19af99ee10a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.8/texrs-v0.6.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7591011642419c4c0ab58cf7644e065a7aae57ddeee980c405ec73baa703986f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.8/texrs-v0.6.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7ef16fa3abcb29a0c6395054f63f576bfed6490d954aca694ee16b510d3a42d"
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
  #   texrs-v0.6.8-x86_64-unknown-linux-musl.tar.gz  sha256: 5fa206b596643c67fadafad6d663db665aef21020f3bc743c6459d2033e05f27
  #   texrs-v0.6.8-aarch64-unknown-linux-musl.tar.gz  sha256: ca96bd5daa2a91842d64eafaf61e4fdd81353555df4aa5894efcb3244b5d4898
end
