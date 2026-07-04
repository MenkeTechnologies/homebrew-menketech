class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.1/htoprs-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "522eb4d1ece6811c21b4ce2e1fac1ab1004b15fab9f356d13593801641408360"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.1/htoprs-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "dad4074eb3abed874b6614313abe63dcf4b12663ca5586b8d0a530b8a22be979"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.1/htoprs-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bc71f8ebc0b3858ea9a308bf9ccb1303c8ef9b138ffc7589afe7e9dcaf268fa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.1/htoprs-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c77ac35a978b34347589f85ec40714a6fb2fc977f0c1f392a9d21e144c7dd3f"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
