class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-v0.12.43-aarch64-apple-darwin.tar.gz"
      sha256 "53eb228e4dc5cae7fe0a21c31a99061fdb00d7a3cd457d596a6d2755cefba874"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-v0.12.43-x86_64-apple-darwin.tar.gz"
      sha256 "3ade1c10c4b3bdf9285fb247bf2d61da896ffe4af7f93cdf770cd147eb2e6ebb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-v0.12.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1ec84f0ba20ffe6e749434ade3456aa7d41dae489b26f8b945cf31ec6f4d460"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-v0.12.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e5159e72f9f3023734773d07ba8daeb8a221235c1598f83565cecb0433c3af7"
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
