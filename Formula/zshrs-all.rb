class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-all-v0.12.32-aarch64-apple-darwin.tar.gz"
      sha256 "e66ea7ac7cc128ffb0428b3ff96da5d6568a3d46d81c6446d67efee234b068f8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-all-v0.12.32-x86_64-apple-darwin.tar.gz"
      sha256 "44ac99dc6f45178b22555a4d2c207bb4b3388e2156e7121a19e9fb6df0367097"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-all-v0.12.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9da9d5e83777cfdf7227957210b3f0f86dde9aea036c700c68dc81392c2b9664"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.32/zshrs-all-v0.12.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11ad5054db246e695c8566db6389b7804ccdb89e3ab8054b9d2b66fd263c30ac"
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
end
