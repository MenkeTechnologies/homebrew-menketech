class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.3.0/texrs-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f77d2c3e4dfb39ea6295beb3a490cf77764581c40598407158b9d338061f0d21"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.3.0/texrs-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "213e0cd55d594e075dd4050236212df624ee62ff0d0d425e3178b87e1c88af67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.3.0/texrs-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d83bc1b1cacf7837e09231dc7b1299fc2fb150e870a2da0c109ccf1629d14f9c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.3.0/texrs-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c1cbd29ebdecfb99c12e21e529a146604718db365181f5870b6427df512ea33"
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
  #   texrs-v0.3.0-x86_64-unknown-linux-musl.tar.gz  sha256: 5a77f947b84d70affe0c4c96fa93757fe684728f2b1a75b09d908322faf2ec4b
  #   texrs-v0.3.0-aarch64-unknown-linux-musl.tar.gz  sha256: e1dc11a20e3b2d0c873206c4514f17de7b7af2ddffddc7972aeeef52ffa1bb4e
end
