class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.6/htoprs-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "56f3c0eb9ab689ac033a6063aec076f9fcc6b627b0266d89be161aa3bc067982"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.6/htoprs-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "e5f04a70f62a8363e8a4f336cb25afac8da2f779d5cc82f4bdafa28cc772dd09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.6/htoprs-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76966409b8f303390a5202cc2ac3803d275be5d49a6cc51b08c084823da9eafa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.6/htoprs-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "334dce321898d51d73d9684d6de4c5229561d1c35f9798c96c19c8768e6edea5"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
