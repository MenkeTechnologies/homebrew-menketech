class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.1/arb-v0.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "2cec27f893f8c26884ab77edf1ecd204cdafb5ab1b576b0ec4c84aa3be7392ed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.1/arb-v0.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "5b309188e369173b1264afb8d9d4481cc3624bc2b26c36769a3299820822ccc0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.1/arb-v0.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "971ba8b0b3034f7a032c235f4973a0f10622decb75eefbbf8052087210b1be71"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.1/arb-v0.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22566c561431655840998d7aa3caf5b8abedd338310d4d14e7fa39387757a49a"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.1-x86_64-unknown-linux-musl.tar.gz  sha256: 723f1faca1a3fac13ec0b1997b495b9904008e8199161d9e2cc967e46fa553bd
  #   arb-v0.0.1-aarch64-unknown-linux-musl.tar.gz  sha256: e57654427ccb7d75bc47999f12425cce3b58811b3866dab53fe8265af19924dc
end
