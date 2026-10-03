class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "fb12f047a2ca45e2fce7d71f21ae9e8160aeece69a92fac83dc11f2c786c20b4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "db750c448c88c77de5b86c6943023dc9cd8b10d9d87d6b171c992a0691ebfad5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af6e8998538e517a1e2352016ff316534f0adba81d3f5107cce52c461bf378f0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.0/zshrs-all-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35eb567fedfbfe60940d17e1733582e900aea39f879bbd4634b52a42dab46411"
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
  #   zshrs-all-v0.13.0-x86_64-unknown-linux-musl.tar.gz  sha256: 24999c28a66ed7baf2667f7ae7b0bb4402b1edb3158bd59b0cfe56a9f07f00b7
  #   zshrs-all-v0.13.0-aarch64-unknown-linux-musl.tar.gz  sha256: 1b0df6f48dbd9a7dd3a1903843f22859781b5745594e7a34ac3d10cb396c9118
end
