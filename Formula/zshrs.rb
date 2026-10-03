class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "4af22d66052c9b00623d1b06c3bf5ce6e6222d7dc5c9755b8913b637541c777e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "76b687962b7c8173f8681935401f6654d797afa9ac1aa2a4d887f7f497cfa4e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-v0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc0d9f285c2e24a924253560a6f60cc5d4084df037c7f2a8cef92bde1207192d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5fa3e93d9963cfc5b31b6fc761087ef6aa6d0a297e13f6af666fc376c3701920"
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
  #   zshrs-v0.13.2-x86_64-unknown-linux-musl.tar.gz  sha256: 61380c2f92c64a972f0863855948a257f64e7677e3ec18e05a22eb4b6c2fa158
  #   zshrs-v0.13.2-aarch64-unknown-linux-musl.tar.gz  sha256: 924dda57c66198bf99a6e3343203251bb1258ab45617b9895f09b86083d361a0
end
