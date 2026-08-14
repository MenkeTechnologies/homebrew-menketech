class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.52/zmax-v0.4.52-aarch64-apple-darwin.tar.gz"
      sha256 "1cbc5a2ffef5204cd54c363129bf52195cb08d75b87c22abe29e86925389b195"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.52/zmax-v0.4.52-x86_64-apple-darwin.tar.gz"
      sha256 "63e602fcb54573fbe26c588c54e9265a3baf0588c22265a7eb6c34d9fe6153fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.52/zmax-v0.4.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88a612e0c2936fc0d301ea4be5e8415afb4306c7d1d7316ffd6df5247d087ed8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.52/zmax-v0.4.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "846fd022a5462d3bbf19b96f04d243a399cc7d79b641521ef2c3399067072887"
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
