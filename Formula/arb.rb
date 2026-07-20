class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.0/arb-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "16dcab8835de5e81cc1e672ad98da6e3905e3c4a764ecce099cef7ce46ef5473"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.0/arb-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf4e0e1d53d10dbe235eb629870ddbec85b4ae6036dc1fc674c0df05ef661da9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.0/arb-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e44c8d90e31064ac69f2fa03af23cb56190031ab447b9321229852e9055d31e2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.0/arb-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b00b1007560119b29bd977c6b21a0da4bf4595d8f19e93d59dbc5cbdbda736a"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 64b9596e51b610212c21bccf39f812841b162a0d1705df9f700cf53df90e8edc
  #   arb-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 0e2cf852f4bb45b1f243664893680e597a605a9518a9e81d5fe84994507e8b6a
end
