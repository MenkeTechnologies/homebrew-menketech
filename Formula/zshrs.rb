class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-v0.12.56-aarch64-apple-darwin.tar.gz"
      sha256 "5e2a557cce6d256adf95186cc8f06f83f2792d7e85257940568dd0fde0803e66"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-v0.12.56-x86_64-apple-darwin.tar.gz"
      sha256 "f79462153205e3e652e0e7a6bd5ae13a0851095e60b010635b83697870cc27c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-v0.12.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56a74429c294dbdd183b9a4f2bf0be1e405b151a540a9251cb5b20e8f8b35eb5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-v0.12.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f694ed5b61593e2096d3d7c7ae989a49b33d218b6c4d715e605f639b618dc50b"
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
  #   zshrs-v0.12.56-x86_64-unknown-linux-musl.tar.gz  sha256: c0a3f7d333c96319fd215f8604d1f7acc750fbe609bb244d020d56d778435d67
  #   zshrs-v0.12.56-aarch64-unknown-linux-musl.tar.gz  sha256: 1efa3ccaf81c7e11958955be45b743577ba6ad20cf22d0f940a5ef1fec51775a
end
