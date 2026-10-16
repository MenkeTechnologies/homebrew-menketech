class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-aarch64-apple-darwin.tar.gz"
      sha256 "668bad7371f7d08cf01addaa0d8b85630e4761577de2eee88e19b195788e17d2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-x86_64-apple-darwin.tar.gz"
      sha256 "1b9a79e7f7180a051da4bf9060f114148859cc42302353475b4015bd0f654f08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67778cdce5e24394d96b69656fcaf91ddad01cdbe154fddac0dd78107a2fb615"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e374e379124bc27f0ba4133d870417c7fc1935dd3088c2a157aa88ff70cd8aa7"
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
  #   zshrs-all-v0.13.46-x86_64-unknown-linux-musl.tar.gz  sha256: 486412aaba49ad72b7bdd35755075606bdb40bf43f3a84284f3e3a77f7c53ff7
end
