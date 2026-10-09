class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-all-v0.13.18-aarch64-apple-darwin.tar.gz"
      sha256 "3e8dc611d18a117013ce8953dc7fcfeb7045d1347c6a039a4d3da916865e36fd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-all-v0.13.18-x86_64-apple-darwin.tar.gz"
      sha256 "bbbd1e2c78ef68490fc44bf7a33d7a5b16edb5c70613922796f958add1b1eb08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-all-v0.13.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfd74b0ad9fbcc7a9d26b69564b129e13555ffbcd780ce194b13613480ae21e9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-all-v0.13.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9dc389ae0263aee0a9c0fafbb6446ad7c92b0f76c73251320f63c0e7b5b59b1"
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
  #   zshrs-all-v0.13.18-x86_64-unknown-linux-musl.tar.gz  sha256: 17925c4f726da436022c37639b9f4dd808e8722be103207b07290925d43583c2
  #   zshrs-all-v0.13.18-aarch64-unknown-linux-musl.tar.gz  sha256: 5713687a67f0eb84faf21cba9f4f055ff4a48043bba6593fb1b5b7b8dd971c76
end
