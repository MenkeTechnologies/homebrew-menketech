class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-all-v0.13.21-aarch64-apple-darwin.tar.gz"
      sha256 "2903e0c930399929c898270c3b952942d23301d595cea047053a620274ced21b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-all-v0.13.21-x86_64-apple-darwin.tar.gz"
      sha256 "4588a5e51d030acdf67c82fa11f778ff2e180e8efca29f1eb84b74d4d7f2c4a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-all-v0.13.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b35a1eb2a7a0d61e0311f7ed4fbf6f33bdd60fdfd5d3386ca9234d3eab68e8c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.21/zshrs-all-v0.13.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9de8b9d3c7218bb220c277b291c5acfbbc8059469138c9fc8f31e7529d217d9a"
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
  #   zshrs-all-v0.13.21-x86_64-unknown-linux-musl.tar.gz  sha256: 4dc47f51e19ebc18a9f474ad718992a8b668032de3a19f1b88743a0e299a48d7
end
