class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-aarch64-apple-darwin.tar.gz"
      sha256 "78cf65850b5c3a23522eb4e8808ee573ecd29ce709c4be6595979cf7d034aa33"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-x86_64-apple-darwin.tar.gz"
      sha256 "bf2950191aa4c4fea9e86125dc404696479dc1a27da028ddd4c5fba67e259492"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "511119341720b708dc1e2b160f235386a1acbd2eef9e791a5b86ee459e0672c7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-all-v0.12.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58ce8c5a4b8f8f6a9fb1ba7e1dbde35677da05cf19bc67be4c97456dd036f9c2"
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
  #   zshrs-all-v0.12.49-x86_64-unknown-linux-musl.tar.gz  sha256: e299950c5f9e3cff4399a6ba97a39c04f0f9bf47792ceef8f4d15f73fbd8fdd3
  #   zshrs-all-v0.12.49-aarch64-unknown-linux-musl.tar.gz  sha256: 20364cb9670307b5d7db54f435816e66fae2a434ab9dec54ce7588c2c6744007
end
