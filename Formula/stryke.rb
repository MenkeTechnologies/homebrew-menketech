class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.16/stryke-v0.17.16-aarch64-apple-darwin.tar.gz"
      sha256 "d876a78037e3000799881d3d980fa79a4912c7ae8dc54eb6ad62c0df61d309ba"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.16/stryke-v0.17.16-x86_64-apple-darwin.tar.gz"
      sha256 "639d487b85ed187015e165cb5f10a2466d1c76c32ccfc00ca67ca101fc2a37c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.16/stryke-v0.17.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.16/stryke-v0.17.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad605a680d11742733f333ebfdecabd4e62ed317ff8f00fd91a4c93263d86d78"
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
