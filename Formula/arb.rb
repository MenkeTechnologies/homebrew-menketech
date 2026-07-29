class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.2/arb-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "bd1376be58e7aff3571fa1f746b894c2b611618e951fd0df8b3a7dfe0930179c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.2/arb-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "0ecf5b94ac1c97caeb4dbbd8b3a06e3f684431f3cd6d55f0ddcc8550480fa937"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.2/arb-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87a083a64cdd3b9e8f577a73ebbe8c51e27ff37dce00cebf6aabaa7a57a303ca"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.2/arb-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f212e6e3d9349a5d94bd7ac234c344f172ffcd9c45a0259f7f97bad6f4beec70"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 431deb436ef4f88dccfbd2497538d8318d3b9de14013e7d816f0355353e9790a
  #   arb-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 5d51247fa93a3fff6c106b70e4204ea86259e615bf5090de7266575a0d333480
end
