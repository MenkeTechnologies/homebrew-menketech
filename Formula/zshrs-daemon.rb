class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-all-v0.13.22-aarch64-apple-darwin.tar.gz"
      sha256 "3480832a79c1800dbbc625b14178557563d5c36603e19458b0942166f4faecbf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-all-v0.13.22-x86_64-apple-darwin.tar.gz"
      sha256 "02a1159e432b607fc2c975f1565b0e36e2c91312f3a8c11ad35f4229532a407b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-all-v0.13.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "773957e3c1013827b433033d0cd263161651d664db4f0996b39fc42f402619c2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.22/zshrs-all-v0.13.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e5b7f0dbab459b1c01e16686dcb9a53bab7ebecc03f89802ae8d651d99d1727"
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
