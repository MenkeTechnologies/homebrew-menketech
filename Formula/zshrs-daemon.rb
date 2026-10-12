class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-all-v0.13.37-aarch64-apple-darwin.tar.gz"
      sha256 "3422a4e237ad05d9e187013457401078e965a6dc593e04ca1581028733e0ff9d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-all-v0.13.37-x86_64-apple-darwin.tar.gz"
      sha256 "70097027d041c249e8259f1aa4a724854b35a1a83d05a0cef35add847452226d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-all-v0.13.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b424639c314b68dc9d77c45ff0299e8931676258a22df1750e2524063077b974"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.37/zshrs-all-v0.13.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9776c6f6531f0b941ca155962e2d89cca22c2cf5ca081f897214b1ff4e03d989"
    end
  end

  def install
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
