class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-aarch64-apple-darwin.tar.gz"
      sha256 "396c595764f4d90853174389066c4540be2521c0cea46225b8fe490ae0519b30"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-x86_64-apple-darwin.tar.gz"
      sha256 "2f3f11d7cf4d15bf39be57baec4cf603fed526e7b5b301d123e5137393cc9fb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51410c8395948e14fda10f253abc41087886e8aae59c40322689d0b936511108"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.47/zshrs-all-v0.12.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e4c0b2e776666b01382388439f76a00aea2836d3f4d500729db05e9770f9f95"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.12.47-x86_64-unknown-linux-musl.tar.gz  sha256: 20e9e7965c02e5f28c288014f3d32250682adef1c9a2ab850a8183cfd14feae3
  #   zshrs-all-v0.12.47-aarch64-unknown-linux-musl.tar.gz  sha256: 54e0ab244f131edc1d666b5c246d588dd3e09e4397ff6480b4fde4cc2f0891f3
end
