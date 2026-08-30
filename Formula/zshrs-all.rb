class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-aarch64-apple-darwin.tar.gz"
      sha256 "5f2e1e66e566839489415dd2669a1dda1ec310a15b62b54406a713632ba076e4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-x86_64-apple-darwin.tar.gz"
      sha256 "33c2f77ea509b3cf530e3b97b9096d7e05ad5988ad5a4cf58bd17e66bb14b8d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ad76cc79fb67d6e92b84761f178a9a3e670896f14828d86df80087fa5cdff65"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.45/zshrs-all-v0.12.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fbc53514c53e7e6d722a9e72e22051d33f675e725be0e9769877ec9246b00d8e"
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
  #   zshrs-all-v0.12.45-x86_64-unknown-linux-musl.tar.gz  sha256: 8d3b0259c1f5c1ecc5ba493cbf8109e9bb1fe4e427926a9b593531ae4a3aad31
  #   zshrs-all-v0.12.45-aarch64-unknown-linux-musl.tar.gz  sha256: dd99c32ef8ece7b0a2cb9d79f225b2198f13f9e8cf3e46636f45b155424b0a37
end
