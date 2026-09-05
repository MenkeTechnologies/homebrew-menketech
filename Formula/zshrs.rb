class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-v0.12.59-aarch64-apple-darwin.tar.gz"
      sha256 "f922ee6246e190b7cc2cf62590c3a90d4583cb21d0e956b9e75a5ab3a46ed6e8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-v0.12.59-x86_64-apple-darwin.tar.gz"
      sha256 "eb6b8ed75b81caa6cc7a40e25f3a097bd94fd5bafbe9e283365ecd311d5a10fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-v0.12.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26cd4c6c752d7c0a0145184a766eabf6617bd37bd17e8260b64cdadd7a835a0e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-v0.12.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d19bcf82373555afd1bd0a1fae918d66e796f8e1247c710ff2584e8e5a2c673"
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
  #   zshrs-v0.12.59-x86_64-unknown-linux-musl.tar.gz  sha256: d4aa77e5fb6b406af1791a51cf43aab97c1d9fd13bb37273c98ef037a488aa73
  #   zshrs-v0.12.59-aarch64-unknown-linux-musl.tar.gz  sha256: 1702bf73a00432dc3a354b481ae9375626bd92dd9ed35b65389a6c1e17369a03
end
