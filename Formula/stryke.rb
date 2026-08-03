class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.47/stryke-v0.17.47-aarch64-apple-darwin.tar.gz"
      sha256 "1c15a0553b1b1e3006635c21925e4928fbe8e7291e7a6e828ed28535544aa246"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.47/stryke-v0.17.47-x86_64-apple-darwin.tar.gz"
      sha256 "248dd18e59c5f984e508e7363e767efc17efcc24a763647120f305e7be2cf670"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.47/stryke-v0.17.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9cc3f22e48e3dcae5a48c7f63835a82957943de69a6d222d774ee0804e34ac2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.47/stryke-v0.17.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b8dc847d3f855f68e261d1a0ef9514c7390d4823e1866fb91bf12c6c038b162"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
