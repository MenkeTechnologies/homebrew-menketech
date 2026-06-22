class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-all-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "c9e6b0b70a18613b157705a945d7c478333811578c8d558689cfd17b7b70cbb9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-all-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "83c260a449cef5bfda6a763b351be3ea11b0b6692114331a81196952271da210"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-all-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bff456fe50a44af02f2a3474be4e6cd611ce17701807ca98971ce7cd4b081a7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-all-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3305e5696eb1641045ac7581f94986c070164c78a651f9176005babb825322e8"
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
