class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.21"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.21/zshrs-v0.11.21-aarch64-apple-darwin.tar.gz"
    sha256 "8230f5f88f5fed4248947931d4d5306451f7bfd9366d4b0fffeba56f180d500f"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.21/zshrs-v0.11.21-x86_64-apple-darwin.tar.gz"
    sha256 "c2ee86479444110cd846b6a98845546d64378555dd7f5a39c83ff8c5f7dc4461"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.21/zshrs-v0.11.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "33be1f46423e42f295138b437fd324d2cd4a6694ca6027146eca082a1e066189"
  end
  end

  def install
  bin.install "zshrs"
  bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
  end
end
