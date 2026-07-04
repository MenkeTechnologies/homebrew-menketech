class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.2/htoprs-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "9353bd928c48d57f5ed40e80fbdf5ff6d5643a26b7f8a0ce17e3d58ef892274a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.2/htoprs-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "7cc537a01ea8c6460b3df547177d8ebe0bd6bc7013951e9893fa62ffcec9362c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.2/htoprs-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bf623c45d59485fadd6b9dd5d8a056dff7ee87219ebe3979615d562695b026a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.2/htoprs-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a91e3ee8f4e25f6af1d701b289bb5a0ed8d292017d7e4ee154f0f4e03ffa951"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
