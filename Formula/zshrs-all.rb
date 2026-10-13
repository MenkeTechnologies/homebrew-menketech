class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-aarch64-apple-darwin.tar.gz"
      sha256 "278de7fcc3991768e0f26b1d54714d30ba5344ddd21711ec7b9067f2bb0c67aa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-x86_64-apple-darwin.tar.gz"
      sha256 "fbc083d7483a10d86131579d8178a30439664cde1377f6d3fc26705ff0efd7d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3362a0eef018bc8eec66f3d0eeb00c2cdd1eb54f32ebf07193f7950cc643b4ed"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03c36cb916db3c67052593269cd72a399bfeb6f6ed62437d2bae443db623d735"
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
  #   zshrs-all-v0.13.41-x86_64-unknown-linux-musl.tar.gz  sha256: 8c1f0948b1cb17d6f50dcfa0c58ee9c5c252adab33beefc7239ee2ed726bcdfc
end
