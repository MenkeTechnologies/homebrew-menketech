class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.4/htoprs-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "f0f6d1d6a31214bddb515b62f768d0dd70e8cbf5b6ae0f6437e0449e032c44c7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.4/htoprs-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "fd0c3bc5774829f361bb63ed546213d7c5b7be3ea859e413fdd813a5977dd472"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.4/htoprs-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0454bb54d9f54248bf73beea5ced2100e6598f2d9d584bac2c13899f62e4246d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.4/htoprs-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f1f847d02a607ff7c53a103c0329966f2a73956de5f567410953de99711efb7"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
