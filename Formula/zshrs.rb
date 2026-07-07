class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-v0.12.8-aarch64-apple-darwin.tar.gz"
      sha256 "417bae06cb822845b45ec014f6d99fcb8335e25493335f9d223ec4f437235901"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-v0.12.8-x86_64-apple-darwin.tar.gz"
      sha256 "d18496aec72bbf431568be7f216573327d9905f99ce489a640a65872d5097eba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-v0.12.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1884f27820dd6f898c62e0d1a1748a85825d48b6c32e650fd1eb05b4afc8d031"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-v0.12.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "823bf1406ac1774bd2e04f6f8441607e26dc73894cff8173f9d5a454d4a65c25"
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
