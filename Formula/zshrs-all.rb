class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-aarch64-apple-darwin.tar.gz"
      sha256 "a098e1fa48934c331edabdd10a47ca1a666ca4ef8a7d83e1efd1e915953dae7b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-x86_64-apple-darwin.tar.gz"
      sha256 "dd22e8bf53d7a97782d1515adad3f46fa4cc5c18b34570d647b6864ebfa8d418"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70f11609450263dffc0767f7012c609a10735ab6067a5c68796d2255003864b5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-all-v0.12.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb42ad4d1b36b952197d2bcc7f87929f90b5eced6e5fd78db0ad92a245750bb9"
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
  #   zshrs-all-v0.12.54-x86_64-unknown-linux-musl.tar.gz  sha256: 531b076ab27e758c5f2194d52e98d26000a604fdca2f0dd836e80259432d8ee1
  #   zshrs-all-v0.12.54-aarch64-unknown-linux-musl.tar.gz  sha256: a8f95274e30a6d1a89273bdc24fda2150215097976bd14ffe3e3293db57ec4dd
end
