class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.85"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-all-v0.13.85-aarch64-apple-darwin.tar.gz"
      sha256 "ba9b3e55a6093a9d931870a973b8a5bdfaa0d5adb101332abfd6dc108dab956a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-all-v0.13.85-x86_64-apple-darwin.tar.gz"
      sha256 "a7ecb7b4deabf49fd01a2a25594c529f2bc94cac2b5ca1762763a230b8ee35d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-all-v0.13.85-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51700a9cb352fb38db36d312b0f444a3fb2f65a35daa4bd988480ef16ae74318"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-all-v0.13.85-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "161123d475a186ffc82d62bdcf904d2548426a89fe4a22ab5552d89617581026"
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
  #   zshrs-all-v0.13.85-x86_64-unknown-linux-musl.tar.gz  sha256: 86d0c1a4f4639b08cd2bbc65b65e29356032d9751980018f51c12bfb1406ee98
  #   zshrs-all-v0.13.85-aarch64-unknown-linux-musl.tar.gz  sha256: 59e90e61978c4239da08257557488caed0ca87abfd0539392301b53203fbb6d0
end
