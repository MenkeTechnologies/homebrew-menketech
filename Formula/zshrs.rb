class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-v0.13.21-aarch64-apple-darwin.tar.gz"
      sha256 "e704099ea4f32cfc9ad7ac39cfcc11f2e794228901460ab3bc60c9c1daf43021"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-v0.13.21-x86_64-apple-darwin.tar.gz"
      sha256 "1e7a04ba6bf286cce33dbbdd4298ed999396274f4c251015df5b7b62219a3690"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-v0.13.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bbf02b9d13b7b833c44909a254308ccb96d1b77b873271b7b7604b3a65d6f2c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-v0.13.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91d62a81b2449058878d7f533d57d538144364cd6ad2dc3606e28edaca18cbe7"
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
  #   zshrs-v0.13.21-x86_64-unknown-linux-musl.tar.gz  sha256: 794c5ad94fdba21b510afefce8bf71482d81bf5400354d792b73760537533952
end
