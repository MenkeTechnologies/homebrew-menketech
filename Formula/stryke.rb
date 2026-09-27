class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.56/stryke-v0.17.56-aarch64-apple-darwin.tar.gz"
      sha256 "b73fa2337b4375d0509bbf0324de163b611f8084ea9890e485c11b5c859dd019"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.56/stryke-v0.17.56-x86_64-apple-darwin.tar.gz"
      sha256 "c44569fe37bc37052f2d4b1f2a6f39abd27833cfa0e953396d1a54f6854d94e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.56/stryke-v0.17.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67d307bf8de614de58952db4d38c0e3419094e3edff9eaf862d465560f7cea3a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.56/stryke-v0.17.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59642cf6088717e9487ef05071f04f7a1e3dd7c067c2eecf7e5c4b096c5557ba"
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
