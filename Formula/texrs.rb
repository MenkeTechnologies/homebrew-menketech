class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.1.0/texrs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e4dd13b99ad782a35be27b02e4ece61cd5a91e6aef7d52c2299070a83f15380"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.1.0/texrs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "1328736665671da8b76cd881531592b3c03e7f9d6db6212f9c4daa4c1b9a6830"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.1.0/texrs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a012dd9d8be47c2a98a3557d8ff7621ae0f86fd80108a7dc8561da9b9c7258b3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.1.0/texrs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fbb89d91d9ed4d1dd6afe7d25a1f75ff4d84daded401c4048943c86fb5324d7"
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
  #   texrs-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 8018aaca70e639f5bb6222d9e58ec01dfc300da118f98c0ad47bb71d6eb1860e
  #   texrs-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: a8a06bd700454eb20db4cbc0a04c998522a8d7e7a024ca0dd55d05ae233b4e29
end
