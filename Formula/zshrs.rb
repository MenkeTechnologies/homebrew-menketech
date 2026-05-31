class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-v0.11.26-aarch64-apple-darwin.tar.gz"
      sha256 "dd7aacbcd9a1e5a462c451949663d976ca0f14665b75310badb5ec93e3bb5cdb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-v0.11.26-x86_64-apple-darwin.tar.gz"
      sha256 "bbeb3a2ea6c95913a65781975b80ed2fa87e8bb26c491158cfd86c35d7bc2a8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-v0.11.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44978ec9a7ef4622ad70b0eba95d3a0be92f95ea5267fd9c6092574d34460cb0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.26/zshrs-v0.11.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d81c77fcc3f0729138e89e544d978cb0779126fd1f9501ca081d7d1be548b4d"
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
