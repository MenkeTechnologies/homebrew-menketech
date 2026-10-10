class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-aarch64-apple-darwin.tar.gz"
      sha256 "d0b7f97035de51c81f5ca4999e882e7ed8b120aa5290eda22325b7dd9f13382f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-x86_64-apple-darwin.tar.gz"
      sha256 "31009b344927bb8b6437151c88a320a770a16c4dabd9c00ac727d3923f749f35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "734040ad5021877bd94a1f013314029eca85fbb08213c2d08032f6386ce1568a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54bc122abfa66727c1dc40b1418224f9226dc0ccf03196ee4b8abc81391be830"
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
  #   zshrs-all-v0.13.25-x86_64-unknown-linux-musl.tar.gz  sha256: ea24b329b8c81a8e5f7d87d53ac0c2a496461346ff4115de8a66979904aed37a
end
