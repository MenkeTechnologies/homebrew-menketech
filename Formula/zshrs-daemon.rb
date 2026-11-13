class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.72"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-all-v0.13.72-aarch64-apple-darwin.tar.gz"
      sha256 "5175a7420eca0ab41b25b26bc6d47bc852b076114fc46c91aae173321df6fec9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-all-v0.13.72-x86_64-apple-darwin.tar.gz"
      sha256 "c10df03cd09688e7a166f1f3086a896347954190b0ab82375621e910687ff6de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-all-v0.13.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "576c3cd0d7e61d0eef0f57cf590d10f4c5fbd429ac331404fcdcc2a1894a1a6c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.72/zshrs-all-v0.13.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d56fb73e849ee01c83ea60f3f71042e121bdbf99908316755a56338cb72bf9e"
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
