class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.6/texrs-v0.6.6-aarch64-apple-darwin.tar.gz"
      sha256 "62e41d6704bc468d1efe9097c45d9bb8fd1ba5d0a603f21a7646424b42fa7c14"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.6/texrs-v0.6.6-x86_64-apple-darwin.tar.gz"
      sha256 "87132e5e7b295fc7da495cdeeeb9d1118cbf9597cf4ce17467c76e8267976c66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.6/texrs-v0.6.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fb3b8872625bc04c4f1cf8aaa148822a233e47d864b76c1d23e917781416f26"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.6/texrs-v0.6.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd5b353866eda6ad0daeb5e0cff9cf30771a5a9dddaa3fb990da44b0a1137756"
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
  #   texrs-v0.6.6-x86_64-unknown-linux-musl.tar.gz  sha256: c67997aaccd84d604a5c5db38846fbfb822dfdf869364e1f1b6c97988f74af17
  #   texrs-v0.6.6-aarch64-unknown-linux-musl.tar.gz  sha256: 44c2a8b0c81c6f2128c5973e3c938af5d1730b1e4bf4b65e9aada3964164fb20
end
