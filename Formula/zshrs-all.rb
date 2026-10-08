class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-aarch64-apple-darwin.tar.gz"
      sha256 "638c63a4e4b9d435200b50d76141261530709d9a9ef019af758956c4dd0ad1ad"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-x86_64-apple-darwin.tar.gz"
      sha256 "912019c31993becd3603a691a98d3dea654d0258fc12c0e6d8d0654628719192"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34ef3b44c603593798282890dc987d48c0516a609803b179ceb0c76e6ee9dbeb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.14/zshrs-all-v0.13.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58168a7060ebbf7ec3fd9b042418f643a5196564b82f6ac1847b621605ffbdff"
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
  #   zshrs-all-v0.13.14-x86_64-unknown-linux-musl.tar.gz  sha256: 0c8c6418d563ca608ae8f6c91eea632ceb36db76dcfdc12ed98c88b4f897d396
  #   zshrs-all-v0.13.14-aarch64-unknown-linux-musl.tar.gz  sha256: 4b2250d62fb7d43cecb4ec860000faa15384edc79591ee9a1f3fdef841a7423c
end
