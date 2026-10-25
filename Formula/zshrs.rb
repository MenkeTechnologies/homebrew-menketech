class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-v0.13.56-aarch64-apple-darwin.tar.gz"
      sha256 "f99e8cf02b2dc2a89dfc6ab896792106b35920ec15af62390d74c0ec329f51a3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-v0.13.56-x86_64-apple-darwin.tar.gz"
      sha256 "fdb623d48faac068949077e72a44a4db94ab9ea17a7923f7c8adf6fcad3ee1d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-v0.13.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "163534d9244affd17e51b1c8e58c818ad246f558a7810974b4e4131db593e036"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.56/zshrs-v0.13.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54b8c03dead6c3ea0a8b806806f9ed2e756151ad53287bf8f570c1266eef3257"
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
  #   zshrs-v0.13.56-x86_64-unknown-linux-musl.tar.gz  sha256: 289f648897be10f4101ef077fbd71b3f4d119561d380682daae01f58454556ec
end
