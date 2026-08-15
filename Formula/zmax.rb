class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.56/zmax-v0.4.56-aarch64-apple-darwin.tar.gz"
      sha256 "289265dece90beb9ee51c68d3166f3bc17e5c8035154222e37df0e2a9f0b3678"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.56/zmax-v0.4.56-x86_64-apple-darwin.tar.gz"
      sha256 "7680fc0d3c64231f6c5822b6b2dc4a8db64d69c25600b082c251f60e3391f54e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.56/zmax-v0.4.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e019cec61ae0802ab0321f405e95da990bc50f360d5a360ee1f739c77533a93"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.56/zmax-v0.4.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a03454998c30e2bff4b743770803477e6db1cdfe05d065b30d780e7a9d9d7480"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zmax"
  end

  test do
    assert_match "zmax", shell_output("#{bin}/zmax --version")
  end
end
