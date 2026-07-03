class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.4.1/htoprs-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "87e3d70ca493b2663489a87fbc6521ea72f2a42256e6f34c3f78b995e6686dc6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.4.1/htoprs-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "14fa15a451a6373575cb147fc53a92c2fec9be91aac61f85fd804ab729f15e21"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.4.1/htoprs-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ef3eb3181a075b4a16f0e245c99b55c5573792bbd041a262331a74d6caefd6b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.4.1/htoprs-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f565f8579c6e331e2bf51c2656d37490d63dac6e1a19197929ca5fe35531641"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
