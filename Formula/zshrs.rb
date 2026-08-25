class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-v0.12.39-aarch64-apple-darwin.tar.gz"
      sha256 "a4cb06918cd7e7c75e26dab32e4ade75e2af5ac60160e05d7f71f49b003aacf4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-v0.12.39-x86_64-apple-darwin.tar.gz"
      sha256 "dac0e4aadc2a0d695eb753680ff29832b7118ae0641dac8f2246ac264e18653a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-v0.12.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "475614e59bd8868b5684f81a011e74e3363a811a91d63773724c3dfe06e51ff1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-v0.12.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c1d462a009b0617ced2f51c9748903559b7d6dbb106d7d0adf50ccddd8fa0ca"
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
