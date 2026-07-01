class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-v0.12.6-aarch64-apple-darwin.tar.gz"
      sha256 "158378e872cf34cf2200b88171dbdbdad45476009a77e2455509b26928ad20b5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-v0.12.6-x86_64-apple-darwin.tar.gz"
      sha256 "3e014660a7ce4de0192e5ce4f209f58d4c14fa4ca68f29137c1fbcb5b7c14b48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-v0.12.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6f98b7d19a9280261ae236bde20b184dfc31e39f24c6ac8cef9e9522dd569c5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-v0.12.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4bb088f68fa03fe59bdb19e06c22bc4379ad50be5e87884faaf7ce59d8ea194"
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
