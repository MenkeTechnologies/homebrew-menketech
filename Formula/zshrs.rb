class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.69"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-v0.13.69-aarch64-apple-darwin.tar.gz"
      sha256 "a1c89169c8deefc5b9746b167a7697b0717e127659bc97c0ec396f7b5b79b404"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-v0.13.69-x86_64-apple-darwin.tar.gz"
      sha256 "7ac147de220f17928f5e15f7f72e37a00f820bbbb81397fb0e63cb28ade5826d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-v0.13.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffee0c117e54e921b9778b808529ea229bed27821a9f3fba60bec249b6bad2af"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-v0.13.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c36f4f7617df5237686d413714cc178a5d87b598bb8b975d4955351b8f3f9ed7"
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
  #   zshrs-v0.13.69-x86_64-unknown-linux-musl.tar.gz  sha256: 5193108501a4ee759209ba79f2d576675590cf866f710216aee996ade5cb20eb
end
