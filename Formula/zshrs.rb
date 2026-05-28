class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.19"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.19/zshrs-v0.11.19-aarch64-apple-darwin.tar.gz"
    sha256 "c1e58fb374f81886689c06e85641c0518b45b4ce76d93f185b3035c03053e54d"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.19/zshrs-v0.11.19-x86_64-apple-darwin.tar.gz"
    sha256 "b4c5b74b63318e749ce0f6f761740b0e51d4bdce8e458b13cab8858130e7783f"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.19/zshrs-v0.11.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e5e0862582e5bee7062fdcbe16b8c34b99eb24407c3b785896f508f0280729b2"
  end
  end

  def install
  bin.install "zshrs"
  bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
  end
end
