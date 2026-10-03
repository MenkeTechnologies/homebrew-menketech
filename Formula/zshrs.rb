class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-v0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "199dc480cf918bbdc0cd66f0a1d7f0510181186424b4e28918265ee1c4a8250f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-v0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "62b916231c5cbdaf3561e558e203ed5c69549a79ff56510322256655c85a8c24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-v0.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52311cd98f4607bae2ca3f198ddae8e3274d4a09809d599ddc5287412b7f19bc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-v0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8031206667b140b3f8d22b93f49f1e4030cd33c6abfa17fb12c272131240d88e"
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
  #   zshrs-v0.13.3-x86_64-unknown-linux-musl.tar.gz  sha256: e64f463a08a4d08e1a5d50f1e7ee017479e1496543e92fb14eed5d660311cfa7
  #   zshrs-v0.13.3-aarch64-unknown-linux-musl.tar.gz  sha256: a0c1dc926b71be75e8b132126e883095b70ae7b5f48b74f81ce9e51f634c4771
end
