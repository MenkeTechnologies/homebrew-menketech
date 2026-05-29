class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.21"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.21/zshrs-all-v0.11.21-aarch64-apple-darwin.tar.gz"
    sha256 "5965b84c0d385970ad84db5d1052bd040dfaef0238c6747cb1dd47a687bffadb"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.21/zshrs-all-v0.11.21-x86_64-apple-darwin.tar.gz"
    sha256 "6bd25d77da63890082d074bd25d9a49065c53f9ed7b836f9c699cc403aa70824"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.21/zshrs-all-v0.11.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "73b80752bb23f6f1a63d6fea4649d2c343e48d77d99280c7c012f473f3d0d8c1"
  end
  end

  def install
  bin.install "zshrs"
  bin.install "zd"
  bin.install "zshrs-recorder"
  bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end
end
