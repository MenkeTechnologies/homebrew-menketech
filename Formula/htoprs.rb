class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.1.0/htoprs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0788fb7fd893aaed1184fd6fcd69afe81881e8df7b42e5a1a6c7c5e570b58d20"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.1.0/htoprs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "161ce463da2a7c4520fb8ae66feff3af9b734806626098a281a22e11b7435f89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.1.0/htoprs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07d5f89512a4ac971549c15f2ef2f99397a4037c74d181b3e9134141c6286787"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.1.0/htoprs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f63256a6c5e8c038b77a01110b4b00664ef21369ca807942f498141789f18d3c"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
