class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "MIT"
  version "0.5.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.11/htoprs-v0.5.11-aarch64-apple-darwin.tar.gz"
      sha256 "75f44e369f7e00517d6fe9fa3347f9fca254aba07b02f3fddc368e031cb46294"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.11/htoprs-v0.5.11-x86_64-apple-darwin.tar.gz"
      sha256 "9f4f9304b19797cce2666cfa8e5a018065a8dc259c382b5252836655db5a9048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.11/htoprs-v0.5.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7c7637a02ea8cd4319b61ef9e94e65dccb59a2095e06dd202cf6ee0a3933066"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.11/htoprs-v0.5.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64fbfadd5b8e9dea1ce35ac5102714850bf5dc66e0f7f117d748af10a0020c22"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
