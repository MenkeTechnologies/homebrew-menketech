class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.33"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-v0.12.33-aarch64-apple-darwin.tar.gz"
      sha256 "3352e5bfbaba7bc9df2620495c9d9160f676381fbd2f8a052c1d9db3edaafc8f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-v0.12.33-x86_64-apple-darwin.tar.gz"
      sha256 "57d82a8d173002c6ff0d1478f57ae797a665955123233abe8e78620e3247b6cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-v0.12.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b371feaffa18e803d2b587730af15dc0530a337dc2b0caf699f9df5535b2cbe6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.33/zshrs-v0.12.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb25bc8d98195c442b5276269821708fc4e40e6c30febd3aa0f5915c915ed79b"
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
