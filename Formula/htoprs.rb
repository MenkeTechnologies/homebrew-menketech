class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.5/htoprs-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "b8de114dce23eff879fb7e54ed490aa93505c6cff8e0cd7cf8c3496f9c6505c2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.5/htoprs-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "3e7321874e50091236bfc7147f13dc2bad0c736e397be1a1509efc08fa3e796b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.5/htoprs-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f4e9919319b47a31fa76c6b6f0e7b552b2e8f9ab1efe350f4a354582d000438"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.5/htoprs-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29654be5b58d703c3ec9315fe998a1fe4c5e85f82b69678b0db2760494b3a4ec"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
