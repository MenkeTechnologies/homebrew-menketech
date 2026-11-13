class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.73"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-all-v0.13.73-aarch64-apple-darwin.tar.gz"
      sha256 "f2151b01c2788f7cad91cc2cebe461cd63fd54f788a170873eaac0bffe04fdf4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-all-v0.13.73-x86_64-apple-darwin.tar.gz"
      sha256 "0f96b5da152b4e2eefc28ce02fa21da75afeed51169986fc2c813d3fc111f225"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-all-v0.13.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "24e37009e9750277b278b9e7c85cfd4c59f2ad29ee2be29de84145815f260d33"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.73/zshrs-all-v0.13.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fd046b38e4e38158bbf7585f8729ed642d8d772b717314877480d1d9d4f4884"
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
