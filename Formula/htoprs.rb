class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "GPL-2.0-or-later"
  version "0.5.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.7/htoprs-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "efd6ccd1cef6d965f673350d75044bb801841fed775b83d7fdc9726b755815dc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.7/htoprs-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "f22ee114dba23c0505f31c014967cae9657ad6ae7405c585e20895313ad5de4c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.7/htoprs-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a98d9a38f0a7907a9ae1c1c76ae951f6a103a9fabd87fa10f41e38a12c0b5ea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.7/htoprs-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7de24a08c4c57f88bac680317553feed5a9859fba34543bb5f406d9af8779a73"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
