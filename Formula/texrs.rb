class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.1/texrs-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "863b20bdf296b8011718574d43e6171296bbe1afc00732ca88866d7a097c1ca5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.1/texrs-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "d67b553278606189b7c45c6921a560c68ebf2da32668637158cf750b3a0f9a2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.1/texrs-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0ffedf2263a5825405852ad0466cc96708268a9422225103958bcf754aef44f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.1/texrs-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f006c585a3c25bdeb322fb62a2106ee8bf43e7f7a797af2883856b7af928bb78"
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
  #   texrs-v0.6.1-x86_64-unknown-linux-musl.tar.gz  sha256: e1697b7e198a3d7b645a78d43f2726cd71b171e4a27bbf12b64273b1bc79f6dd
  #   texrs-v0.6.1-aarch64-unknown-linux-musl.tar.gz  sha256: 0b872f2b082b0e48b3524610e55b0697f6c2ef502cb42ef0fb303f08e193ae96
end
