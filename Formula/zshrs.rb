class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-v0.12.28-aarch64-apple-darwin.tar.gz"
      sha256 "d06b33f223a7a8d8b408c0274975fba30a13d63c949ca6e24bb1ffbc68c9238c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-v0.12.28-x86_64-apple-darwin.tar.gz"
      sha256 "6e7b6b155fe7a4c9e8f11fa4fbc7efefe75f48b43d79c7d7788f66520484f004"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-v0.12.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d0042aa049c9d9324cd5e38dfc6462e0d87d9dacdb7a3a03a506f6da7003a83"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-v0.12.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15b19df1d64db69032a8052e743ed3eaf1fbebff5513bdc2feb38884e573630d"
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
