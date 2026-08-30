class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-aarch64-apple-darwin.tar.gz"
      sha256 "f71b34d075150d1c503ca3c2c45814bb35e76db1eddc956e9dfab02e25e63aee"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-x86_64-apple-darwin.tar.gz"
      sha256 "dc98552d84f9436b788ffb99e46deddb55bec0e9a015cd91d2544d2b204fd5db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7771a1e629f7023a4070269c2a608cb0c81cfe97f13fda0a0dcb35a60b3ae619"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-all-v0.12.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe7d7245ca8ac2bd1e57ddbd1a9a8d058448fc1cab6a295c96aa322fed4d9893"
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
  #   zshrs-all-v0.12.48-x86_64-unknown-linux-musl.tar.gz  sha256: be40b33b168c7952b38981f17406067c07c791e0d998aef063c26e631902fd6d
  #   zshrs-all-v0.12.48-aarch64-unknown-linux-musl.tar.gz  sha256: f000fc919660e960b4b4cd508e9d465edfa96afdb01ae07b36dd590a81af2203
end
