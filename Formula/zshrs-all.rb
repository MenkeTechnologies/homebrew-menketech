class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.51"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-all-v0.12.51-aarch64-apple-darwin.tar.gz"
      sha256 "ca2f3ca230e971edb83b9dc13f5f24518c376436a1def10b946d5ca83e160ea9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-all-v0.12.51-x86_64-apple-darwin.tar.gz"
      sha256 "779bc02a0022f6ad8369cb1661b9f7eb3fc3d4c642bb46e95e290d96ad92bf46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-all-v0.12.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c39b62a72fc79db0cb3e7f472f6efa4e10ac3c3bd9b66350d88991af8b707ee"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.51/zshrs-all-v0.12.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88dfcd5721f135cb7a1b1532075a3f5871b1aad02b1bdda213cb1446c482b1ad"
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
  #   zshrs-all-v0.12.51-x86_64-unknown-linux-musl.tar.gz  sha256: 5e7aefdcce242e2e975e47233389cecf3a4404ac70ceb5aba8ff78963ff7da09
  #   zshrs-all-v0.12.51-aarch64-unknown-linux-musl.tar.gz  sha256: 28f638072bd333bd1db3454c6b6ba23be531b9d0866223bceed736b9e0cfe91e
end
