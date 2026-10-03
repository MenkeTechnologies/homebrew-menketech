class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "a2a67b865f899fc3d0fb03f9b51c57a08aedb5b1f137e877baa19b5579ba0e83"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "715a4b033821b3dd92b3070314bc9a372566b089c6f129a94c72a7548cd7ce80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5169c18432612aa7aee72bec7e3b32f76c30eba0188c9f54e922fee12b19db7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.2/zshrs-all-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d75bc5890b7b1c9f4b443bbbce5d24d06e4326b709f313628f173ab82dfbed3"
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
  #   zshrs-all-v0.13.2-x86_64-unknown-linux-musl.tar.gz  sha256: c6ebd9bda0da466aa7b984833cd386828c2a995b6cef23b74b114dc2ed28f7e1
  #   zshrs-all-v0.13.2-aarch64-unknown-linux-musl.tar.gz  sha256: 0c658a83ae8dfede5dd77a45932b304f5d65db806a9f0b403a2b41bf69c84658
end
