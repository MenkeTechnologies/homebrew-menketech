class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-all-v0.13.28-aarch64-apple-darwin.tar.gz"
      sha256 "85c7b75e3a4c63fa41ceb2558414a0f171bdc700373a4658b42acfc194dd6313"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-all-v0.13.28-x86_64-apple-darwin.tar.gz"
      sha256 "20153328785d6cd670fe3050dabb095f9d23e977716816da468080674621b113"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-all-v0.13.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1265555e8efe1f676e70e82b44667e6d68892f3b5c5eca4bd0e3b5d279d07a03"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-all-v0.13.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f682e5ddad67bfdf837153a24827a34c75152ebb9d4ba70913fa465318d982db"
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
  #   zshrs-all-v0.13.28-x86_64-unknown-linux-musl.tar.gz  sha256: 3e41fb3d647af0fedd2a3a3a3f2a200af79723980483916a242d8d7f806b5928
end
