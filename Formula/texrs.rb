class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.3/texrs-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "2ec6257154a7de6ed7f542078be9a2da1104200efe163e0b1c7685ef2e7348e6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.3/texrs-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "d74c10e2048442aec63db894576acd694946c462c5c00498b1ccf5b668a74a1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.3/texrs-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32411dff524d92eebc64937244fa182fe5d19fd1833c3a5665be4feeb3bf6ab0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.3/texrs-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8765319844b3e300d98ae86f95bf9baf101d8af54215e9f5d3251a9a588b231c"
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
  #   texrs-v0.6.3-x86_64-unknown-linux-musl.tar.gz  sha256: 2099f2fc792527b258c29c2503cd06684559b09d261fa4c0457185379283d19a
  #   texrs-v0.6.3-aarch64-unknown-linux-musl.tar.gz  sha256: 1aa06ef78c92c39289b038d65df31e4fc76bafd316314339aac07bfd4f60141b
end
