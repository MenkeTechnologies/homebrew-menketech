class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.77"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-v0.13.77-aarch64-apple-darwin.tar.gz"
      sha256 "4bf7aedb10cc6f0f93a3122dae1ddabd9fa4f3e61201b2c02f34c7214525c45c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-v0.13.77-x86_64-apple-darwin.tar.gz"
      sha256 "aa3ce8412eaae301801505bec0f641852c67d78df4de2fc6b0fb0e5b544518ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-v0.13.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a29ae6a9c4490ca09e451f305a497ec256c2579ef3cdc57a8110435d99d26b0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-v0.13.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34ec2c1e623dbd18fb5e73fc2e9e1da9b38f473aa8f4b5843fb64ecdd917ae68"
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
  #   zshrs-v0.13.77-x86_64-unknown-linux-musl.tar.gz  sha256: 3446425ec17cf0f778a537b1f121b6ab148372044cc9740448b65da90df3f034
end
