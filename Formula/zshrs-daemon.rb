class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-all-v0.12.36-aarch64-apple-darwin.tar.gz"
      sha256 "cff766f205186240fdcbaa9f9a8e344120e284d05a7ada48a6b8cb30cdb8c4f7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-all-v0.12.36-x86_64-apple-darwin.tar.gz"
      sha256 "3e8fae1721f1cc939502a9a8303c48105b997d9255b0c7734c67309f09440160"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-all-v0.12.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2b846f17eea2351ad5a03b829ca1edcec5baca00b69cc849e5bb6939ae1584f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-all-v0.12.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8aa26f40486090b6e717f9da245f42ade15cefd0550626c611bb9f9d06431933"
    end
  end

  def install
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
