class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.8.2"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.2/lsofrs-v4.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "5ad89a159ed25517643ea09b6329adea07c889f6943c5a01a1417adcbfbe0d8b"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.2/lsofrs-v4.8.2-x86_64-apple-darwin.tar.gz"
    sha256 "47f6c3794cc10f1cae88b586828578ce50d61a251669a0c303942f64a825781d"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.2/lsofrs-v4.8.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c9243b31932906d071397bc043de4750b8125cb1feafd72b02c5f918950c6d7a"
  end
  end

  def install
  bin.install "lsofrs"
  bin.install "lsf"
  end

  test do
    assert_match "lsofrs", shell_output("#{bin}/lsf --version")
  end
end
