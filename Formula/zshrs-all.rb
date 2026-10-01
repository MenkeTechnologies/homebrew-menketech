class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.68"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-aarch64-apple-darwin.tar.gz"
      sha256 "200cab4dd146ce4f879b1dff38321820a8d12ff974bc255a85c0f199170b0747"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-x86_64-apple-darwin.tar.gz"
      sha256 "63fa0253112f100cb84ec548bf18944491c64d492decc0100da1f078fb25debe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcf248678aa18255baf33b6d828c51a99530475b310acce2d66f9282df2ccd96"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "520b9cfbb82dc107d1686379dfb92e6d047e3a4867f92a468d52b75f8dff1dec"
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
  #   zshrs-all-v0.12.68-x86_64-unknown-linux-musl.tar.gz  sha256: 8cc3656109d1ebe957fa19d47da2a044741b297ee827995714e3571427ad47f8
  #   zshrs-all-v0.12.68-aarch64-unknown-linux-musl.tar.gz  sha256: 6f67e680043d4776963407250f3ecdcf4f553f0bb16d992bce2091f4f4870a56
end
