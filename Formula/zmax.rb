class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.53"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.53/zmax-v0.4.53-aarch64-apple-darwin.tar.gz"
      sha256 "890484921c83f71ce62b990888bd60fe9c4e9bb0b4b546b49ae26710e4836a14"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.53/zmax-v0.4.53-x86_64-apple-darwin.tar.gz"
      sha256 "df3f0c05fcbb9d2efdba8195c149fa6bf4ddbcb396c528b595bd57077f71b7d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.53/zmax-v0.4.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf84219806c23d39b41358bf026e9dcaf767531b421e42757d218d8ee031a17e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.53/zmax-v0.4.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08e3ae6cea933c6fa2c75afc97b3709b5574a2601c5d467f996b1bc800841627"
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
