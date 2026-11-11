class Texrs < Formula
  desc "TeX mouth and expander in Rust, lowered onto fusevm bytecode"
  homepage "https://github.com/MenkeTechnologies/texrs"
  license "MIT"
  version "0.6.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.5/texrs-v0.6.5-aarch64-apple-darwin.tar.gz"
      sha256 "da3965e5b39c686010c5aa06961f6f82605ec09528e37276d61eb47a0b621c47"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.5/texrs-v0.6.5-x86_64-apple-darwin.tar.gz"
      sha256 "dcb6e9d84f4d5c816b20556c16ac28d2ff90ae4e13360406af998fdfc571a42d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.5/texrs-v0.6.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bc7846c1a7062c17246d08bbde5ae10cb6c5096f0bbff483bc1b3a5b7921dd5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/texrs/releases/download/v0.6.5/texrs-v0.6.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c66ae6481ae807f0ecbd0b415647aa40a403e53116b2521d49de55ff5bbda0cf"
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
  #   texrs-v0.6.5-x86_64-unknown-linux-musl.tar.gz  sha256: a02584da625d23d1c8d4f68388204fbb68f61689677665f9976210f631045033
  #   texrs-v0.6.5-aarch64-unknown-linux-musl.tar.gz  sha256: 7d67ba029a2933ef8eb52186ee10e291ce97637425ad462e9acbc5b165e47bf6
end
