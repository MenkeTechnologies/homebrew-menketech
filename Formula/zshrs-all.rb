class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-aarch64-apple-darwin.tar.gz"
      sha256 "680e64df20706cb49fe7be9bb6959a456d357818035d39410090815419cf173f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-x86_64-apple-darwin.tar.gz"
      sha256 "8eebd79fe804a24dd7640aa700020ab822a08f9e0c17718008ba6f8897829bd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c481e43948983a3f9eb4b483facaab3bbc228de30d389f9d0e22b860c024b5f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "210ddab9ce690ee33933d4c57ccad83e5b6a96d37660a79a1e23d3eced193e5b"
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
  #   zshrs-all-v0.13.52-x86_64-unknown-linux-musl.tar.gz  sha256: 19555bc0ee84a295367afba4bc0ed2b9f34da0245b17c9ab0e455de75e065657
end
