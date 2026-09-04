class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.0/texrs-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "b61f4bd8ed14ce5a44e80c467f9a538b39cbef7ea914e22382a80d584420b66e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.0/texrs-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "cb5821060df9b99a9395889cddd76319e4a6e616b8b0d5096d9aff5756bbab23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.0/texrs-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7061031b8a0be8e1a4a02d2aa332e5f529924db6f2e9a549fe7409e076f665af"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.0/texrs-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a6e06d30630c650d581744cc01d8c7855e0ef35817a31f55d3118e6e9531b49"
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
  #   texrs-v0.6.0-x86_64-unknown-linux-musl.tar.gz  sha256: de6783cf1b26e2c79835b3377f46d015cfe1acf2ee2eeae31286be76b289f63f
  #   texrs-v0.6.0-aarch64-unknown-linux-musl.tar.gz  sha256: a280c528c9abcd31df396fe9f9e93b49fb3a6ee7bc8f4fc6e20ccc1f3a15d50c
end
