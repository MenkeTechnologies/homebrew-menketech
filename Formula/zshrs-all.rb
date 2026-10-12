class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-all-v0.13.36-aarch64-apple-darwin.tar.gz"
      sha256 "d8672d243952169abbbb670b0662fd81d65bc3a19d6d216a35983fdbdc6680ef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-all-v0.13.36-x86_64-apple-darwin.tar.gz"
      sha256 "b1a05d9ef4e94a996243b1a05133de531f119e32736278b538d526fe4df6941f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-all-v0.13.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddee48806ab66269b8b951fc96ff64a4e016013a5e86a5ce5662115214770fd3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.36/zshrs-all-v0.13.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "781b7a35fece7b26f4630af0ef4a4d0da40a4d505fa690532ba8896bd69f8434"
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
  #   zshrs-all-v0.13.36-x86_64-unknown-linux-musl.tar.gz  sha256: b776c9d57d7fc746d8534212160f5d6c70852f3fbe304b3d091e1709c50e5ea5
end
