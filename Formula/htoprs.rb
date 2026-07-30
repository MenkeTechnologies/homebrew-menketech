class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "MIT"
  version "0.5.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.12/htoprs-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "0d0caa7e1585e8f1e5f2f19e3ff5390fc7da9ee2eb15168c254d357836188ea3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.12/htoprs-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "3f15ef42c95214422623e3d80fd42bc8d177d4c3ee0934f6a0ee7c031005ad63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.12/htoprs-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5612a5a3897d0bc86c9768ceede125a7bf072ef0cdb023266782112fcde9f35f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.12/htoprs-v0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "131403ad74554fda5601aab08dfe6a102a3630542a694edbc5f81944b8c16c9e"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
