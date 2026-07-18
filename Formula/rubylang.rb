class Rubylang < Formula
  desc "Compiled Ruby runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/rubylang"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.0/rubylang-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "9448e4a58686f8a87921cc79609466b46b88aef67e131697a9561cb5395e03c5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.0/rubylang-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "babb26fefc61c5e606c24f5c9ec76ce6f196c4a9662c8a31d11e12d2c468e2d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.0/rubylang-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3226adee8d956858108a739af8c61ae5b9d185f0254589809475387bf6cebf3d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/rubylang/releases/download/v0.1.0/rubylang-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd99bb29b9c5bd6fc18fd0fe82a73ebc873267284bd6334b290c865f1d18390e"
    end
  end

  def install
    bin.install "ruby"
  end

  test do
    assert_match "42", shell_output("#{bin}/ruby -e 'puts 6*7'")
  end

  # Static musl tarballs also published at this release:
  #   rubylang-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: a09b1390c676a0756e7913fdbfe982805bfe9e726500bdfafcfbf954a25f3ec0
  #   rubylang-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: e8ae8b628df5d96b1bd095f736ae00abc12a4a3cc1f9f14ada95b0c4663cda90
end
