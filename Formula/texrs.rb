class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.2/texrs-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "214e0813db8f6b5682f07e0572006bfeed1e104a72a5fbab06e113079572958d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.2/texrs-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "0702ca0592d6ad72fb7699529bbf5aae20d4ae6db34b0c67c79cf56f6a486e30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.2/texrs-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77ff15261b8c80a30d043652823e2535bfc76187624ca2b4e3f3b502c8e7e708"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.2/texrs-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d95385ee3cc1bb4b3cf28dc11a96e3c74617d52fe6e2208c09f7819c39628157"
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
  #   texrs-v0.6.2-x86_64-unknown-linux-musl.tar.gz  sha256: 3e8af3ecfe7ad1d6b60926979487ea460c21db37452c8a962d9e6a251ee5b8e7
  #   texrs-v0.6.2-aarch64-unknown-linux-musl.tar.gz  sha256: 490480236961d2e14c104adaabab42b7c53e1e09f5b458b28cff764a4aed9227
end
