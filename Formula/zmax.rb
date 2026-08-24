class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.60/zmax-v0.4.60-aarch64-apple-darwin.tar.gz"
      sha256 "1669394f65ffc5949963c2ad251475e433ab97876c70dcfd09f29c1a3b5a112b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.60/zmax-v0.4.60-x86_64-apple-darwin.tar.gz"
      sha256 "67630040e6698f9b14e945695749ee1816e42724e97195771e1a5f9a62807bd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.60/zmax-v0.4.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b6767f5016a6579d6cabd0e1965074ce2acefdbf6f1fb9e7acaa3ae5a85ad49"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.60/zmax-v0.4.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a9618e7e6d74007b14c63c407e9803c7d45e2e3b74cafddbedc80a7d635873b"
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
