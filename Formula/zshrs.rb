class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-v0.12.26-aarch64-apple-darwin.tar.gz"
      sha256 "93853624d505858d99a47997c25c4ca60e633769f2f709ca9f41aeb17b419089"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-v0.12.26-x86_64-apple-darwin.tar.gz"
      sha256 "ead9bf97be380de774fe01e73be0b91b6b0f6ce7229f78147b00d1a9fd8ca801"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-v0.12.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f81e4ba5fa1545a135996c034b60bc75f03b85f46b88b93655efe6b307553384"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.26/zshrs-v0.12.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11ca49d234fa2c835c61a1639f9a4fcc003270650502c8063da8d0dc065eb5fe"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
