class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-v0.12.57-aarch64-apple-darwin.tar.gz"
      sha256 "1ee6bcaafb1774625a8af1746ca3bd6bdf2b4bd64b22de680991850ab7b1fe90"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-v0.12.57-x86_64-apple-darwin.tar.gz"
      sha256 "9c4f84d4a533fb93f0e25d45c5ab9beb43eb71c1fdee1e48d6e8caa3ce35c574"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-v0.12.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe045eb5bae655dcc7ab5761267c8dbb2bd52b21ffca490713b235b65e14c0d7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-v0.12.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e7735d650f1cde1ad8d12433f2d0ad47b4c47dbfcf6d69e6a51d1b185e4bc09"
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
  #   zshrs-v0.12.57-x86_64-unknown-linux-musl.tar.gz  sha256: cd2cb0ab185a6b0b7eaa1efddb5d57bd87eb2990a7e254b5c7d1f0676b309875
  #   zshrs-v0.12.57-aarch64-unknown-linux-musl.tar.gz  sha256: f1b97432723cd6a0d616a5d63379e275ae8a3679fba9144e0b30bbef5e4c6dcc
end
