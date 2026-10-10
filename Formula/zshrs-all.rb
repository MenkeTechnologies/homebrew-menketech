class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-aarch64-apple-darwin.tar.gz"
      sha256 "0d3ed735bae25385891dac20bf26357f19198cbf310169250b38f017a6229952"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-x86_64-apple-darwin.tar.gz"
      sha256 "dd421cc42a2eedba8ff8c5958e11c39109e19c2a2d5b60e87ebed3335570ec47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47b087c84d53d236b57a90a07086908a78d99275100376144e2d9142c5668ac7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.29/zshrs-all-v0.13.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd6627d0a34e5ba958e8b776f8fb8183900a7345b6f85d2647091ebd99003350"
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
  #   zshrs-all-v0.13.29-x86_64-unknown-linux-musl.tar.gz  sha256: c8fa561ee7c308ad6dc829c6618d5123bb5df95ad72c2faf959956bfeee4b021
end
