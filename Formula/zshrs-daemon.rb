class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-aarch64-apple-darwin.tar.gz"
      sha256 "52d4f84847b146b64598f070cf71603b6a4bc0250f35faef1ab72e2dc2118025"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-x86_64-apple-darwin.tar.gz"
      sha256 "e3f4977d47a4e339c5d066b70d6037f78c7d5ea23ccd5e8ee4ac24cfe0331b07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9758308b9be44af7cff77213cbefa25d9fe33f784671073f83967425e32535f8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0fb1a236baa0784b743a16159701f9dbe88be53c20ef16a462fade27aa011bf"
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
