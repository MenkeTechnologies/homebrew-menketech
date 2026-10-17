class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.50"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-all-v0.13.50-aarch64-apple-darwin.tar.gz"
      sha256 "e210ceeec811ef8d75cc42b7af5dfca0a5fec8497af8eb083073d5804458a4fa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-all-v0.13.50-x86_64-apple-darwin.tar.gz"
      sha256 "73c9d015c28d9479e06217c971c1955a4c15741965d5c7441f8d7fcbc6cf5f4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-all-v0.13.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c29a19039cbeffcc3ca0fa575b132041911e0c5b93f32fe9df7faf1a002caa93"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-all-v0.13.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9794885c541cf1d4efeeda8ac9932e099bc802079a508ccee3e220445562366"
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
  #   zshrs-all-v0.13.50-x86_64-unknown-linux-musl.tar.gz  sha256: 9c14b3c2fbcdf45e1e8edfd1c20fe702d073b2689561adab31f54dedd788e6c9
end
