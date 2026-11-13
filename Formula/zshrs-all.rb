class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.75"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-aarch64-apple-darwin.tar.gz"
      sha256 "a9de7966e02dd2ee140a7da8ccd11c53cb9397aca3ead5b3232b7030dd487704"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-x86_64-apple-darwin.tar.gz"
      sha256 "251998c1f6183fdb286096d6e126a861cc67ad932122a4179c49da5473655ecd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43260988ac63b119737caff3a6d5e6eeaf75b69bd9eb0d07072c1f03ca8d5861"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-all-v0.13.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "863d763e7c4703b1081cc99ba44c3a33da7f237d9f008216087b07c2177422cc"
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
  #   zshrs-all-v0.13.75-x86_64-unknown-linux-musl.tar.gz  sha256: 30ef2570ad5dc3f58c27d4af453385e49629605436cb93e2a56e923a94b77360
end
