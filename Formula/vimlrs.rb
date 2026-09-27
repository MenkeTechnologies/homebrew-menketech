class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.16/vimlrs-v0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "2b66c9fa59fa52cc9ea39df2dc854550422eaeaf5582a0470c383b066e2b404e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.16/vimlrs-v0.2.16-x86_64-apple-darwin.tar.gz"
      sha256 "237f66b109f99b8b5948a5143606e0c83027438baeadb90eec81155a01d87e1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.16/vimlrs-v0.2.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75b05188174f7f25d3335bf3e05429b7e2d64f4215b6fdbbff50d2afe95fb62d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.16/vimlrs-v0.2.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38f76122e009a1531c0a0fc61e3e86d73f950b4c3f780d1a57c8be2be367fde3"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.16-x86_64-unknown-linux-musl.tar.gz  sha256: cae58921497e40aa5fff634d2601a3e997824beeb17bfeb6dfd8a1d1cc444fc2
  #   vimlrs-v0.2.16-aarch64-unknown-linux-musl.tar.gz  sha256: 5fd291996b6e282280b95afa048c4d7fdb15c80b09bd00862d56aab4f7a9b2a4
end
