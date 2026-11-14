class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.80"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-v0.13.80-aarch64-apple-darwin.tar.gz"
      sha256 "71662f06d3b1cb284f89ceba04a51090b8ac323f6dc4e4bf131b976e104649ed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-v0.13.80-x86_64-apple-darwin.tar.gz"
      sha256 "cad9cb8a6c177879a693ff813d4f018a20a4b40b7d1b7a27a466873458c83feb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-v0.13.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bc1b095217b6e7ceed286b5ec5ffa12eff42fc5668d295585d158eb0cb7c6bd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.80/zshrs-v0.13.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91cac6c4b93772a1f3bd6afedd861300ab51bc4e54a0da2075034f8425b48c64"
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
  #   zshrs-v0.13.80-x86_64-unknown-linux-musl.tar.gz  sha256: a6e81eb82c22261d7943299991dac58c3e13443756ad535781566dcc12bf3d3d
end
