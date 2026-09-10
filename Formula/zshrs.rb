class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-v0.12.60-aarch64-apple-darwin.tar.gz"
      sha256 "3da21f31cc39f40afafadf1093dddabd4bdbebb72cb95a332ec6387a0e7517b8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-v0.12.60-x86_64-apple-darwin.tar.gz"
      sha256 "8c1fde834a38733753822a29b3ae3ca800b87a63ee25fe70c74f80fa9929bbd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-v0.12.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf25d1dee93357ba9be69ee2991b5a60edee203eb9b4cf0cb8b0a9828bd21c7f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.60/zshrs-v0.12.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c37c89012475a8eccfa475454553032dd764c26a70e470a48555b6536550d3e4"
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
  #   zshrs-v0.12.60-x86_64-unknown-linux-musl.tar.gz  sha256: 3a7ef228a75b8e187df63eb0496302044bdd1b30d656bb11212bf49a1c9ec97d
  #   zshrs-v0.12.60-aarch64-unknown-linux-musl.tar.gz  sha256: 20362b4dcfc406c3f5f938c41b5801b8d05ebf867e6e2a12049e9cc096c91783
end
