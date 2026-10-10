class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-v0.13.25-aarch64-apple-darwin.tar.gz"
      sha256 "4b10b98708655da30fbcedfdec42628c57c04e0ab4ac7f8759e31764261a22f7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-v0.13.25-x86_64-apple-darwin.tar.gz"
      sha256 "16902f917cbae0acd0c1387a52c790b0e3aeeef8cb02a8ba70c32dd414fa2d28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-v0.13.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "043c76c80db43cf93c3203eb4a5a53b66fe038be06054ca541a80f53059505fb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-v0.13.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "690316c7cdcdd0fd5687c3b42a31676ecf6a067e2ebdacfded72dc8f3fddebf0"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.25-x86_64-unknown-linux-musl.tar.gz  sha256: 7036a11cabce8aa522a7a95e38af8842ba14c2bd3cc90a7af3fb63187e45248a
end
