class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.5.0/zdbview-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "d2030b50db739138373f34c1e0dbdf96828eebcb3545219a0bb9f53a63ad6d50"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.5.0/zdbview-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9922d23aef2d6701007b78c723c9f09ad3827ce8a94de2e5c32d111a618351c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.5.0/zdbview-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c29006578decde7d8ad9143d21aea2dcae2e33a93146d8eddd99e627bfe9903a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.5.0/zdbview-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b89c9a3fdfdc09b9917ad4ce725ed275c1e83e9020f220416fd4b8b00745a75"
    end
  end

  def install
    bin.install "zdbview"
    man1.install Dir["man/man1/*.1"]
    zsh_completion.install "completions/_zdbview" => "_zdbview"
  end

  test do
    assert_match "zdbview", shell_output("#{bin}/zdbview --version")
  end

  # Static musl tarballs also published at this release:
  #   zdbview-v0.5.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 3a9006189136baf6263f6268505190ccb55d1e6b309ceaaccc1ba1753bb3c164
  #   zdbview-v0.5.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 5c7284f909e74814c91bff6af3e20ce6e133acae30b68a41517a86741cb56205
end
