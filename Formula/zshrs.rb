class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-v0.13.10-aarch64-apple-darwin.tar.gz"
      sha256 "241a3aa248cb5b3634dccc7a71b302f5383a35332e15c8de2cde4d338386ad87"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-v0.13.10-x86_64-apple-darwin.tar.gz"
      sha256 "2987489ef88008ef7fade8e6fa1d5e84a0cd0a9a5a156f5a004eac78f9493df2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-v0.13.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d5909af5c8f8d6adcb00b89e80d557cf4dce74959dd830395212bc18680358d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.10/zshrs-v0.13.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18ee7d3f3b97180baaa5cacbe63502c417ed63bd45d4be88b61f3ffe76d4fd41"
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
  #   zshrs-v0.13.10-x86_64-unknown-linux-musl.tar.gz  sha256: c9f823b422848d2da65005dec25cb064ffd04215a846a4b73c4b2c0ab3de7ecd
  #   zshrs-v0.13.10-aarch64-unknown-linux-musl.tar.gz  sha256: 7ea49509303c2e772e927eab79a1ca8c21902521220ca0e1ef0381f42b3dee75
end
