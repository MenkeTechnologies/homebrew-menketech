class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-all-v0.13.27-aarch64-apple-darwin.tar.gz"
      sha256 "ceb28fe5977c80bf9303075ba5a169185882f26665d4e2bdf5a2cf300c336f19"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-all-v0.13.27-x86_64-apple-darwin.tar.gz"
      sha256 "dc5311346224b99f715f66e9c1b48816b01e4467202b8c91c8e7752f172111df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-all-v0.13.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6369a70173cbed49a8a9b2d94f3a0c0bea703fcd9429e0a51122185e6488249d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-all-v0.13.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8dda496923c66a28693477bb6248babf32a25ad81aeb5babf2873a7574aa3c51"
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
