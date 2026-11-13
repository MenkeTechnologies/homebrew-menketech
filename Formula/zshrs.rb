class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.65"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-v0.13.65-aarch64-apple-darwin.tar.gz"
      sha256 "45ec6ddaa71dbac1034e22168e67a3724252f43568f2742634a541ae7b5f0bea"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-v0.13.65-x86_64-apple-darwin.tar.gz"
      sha256 "491ba9a9e2772830ee9250a788314f231e7d479ed21f4f24302fc3ce80d76e05"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-v0.13.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ba5c81bff7650200525663cc2ae18f5ec9b961edd0524b44a1c788e72c22bf5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.65/zshrs-v0.13.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24a0e50ff992bb82e0d2f291e2ce1dd0c3df48c69e1244bd32f6cc7c63b6cf7b"
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
  #   zshrs-v0.13.65-x86_64-unknown-linux-musl.tar.gz  sha256: 6e26ad7b1104e74ac83320f575bab739155c9d826c5da260913d6e9a0adf0377
end
