class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.74"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-aarch64-apple-darwin.tar.gz"
      sha256 "3e2e0848a15f3589d237c511b254be98b036242035f449f50a65aff3fddf0a30"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-x86_64-apple-darwin.tar.gz"
      sha256 "42e48ab2834f4c32dc58e423d1322afc6d13b900ee33a9e8c83b03bbf24084ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8556551fd17e6a23e8f58338f0d36d3c8b21a9fb1e5b318b92b9410a3ea7eeb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.74/zshrs-all-v0.13.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19777f11fcd07c420c9613b5d440d9148f7679277dacede12466cd7be2b1d3de"
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
  #   zshrs-all-v0.13.74-x86_64-unknown-linux-musl.tar.gz  sha256: 7d5ce3230b49c85bd6b0976367757a73a3fbf22aad30d80fd5ec3ecb5b3a0869
end
