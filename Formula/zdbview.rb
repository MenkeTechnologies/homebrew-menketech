class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.10.0/zdbview-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f19ec421b8bf8658238c16e328c8014006e5c522594f5aba932acaf4407497f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.10.0/zdbview-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "1dcf8a017a0f3a9ca71f3172e7b860174d27ea36dc8cf2500bbc30b578ae3fce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.10.0/zdbview-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98807b9890f83556d1b8c1fb6efb38f630edbbf72366a1fdaedf8ec689e95bdb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.10.0/zdbview-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a92091a54d318076ee04bea8d71faa157b6a78f3ff8bda7f1881535cf3b05d0f"
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
  #   zdbview-v0.10.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: cc72929bec3c857cf9404afcf69765a00e48ea737bc77ff6b214cac906d49a48
  #   zdbview-v0.10.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 05c37cb76d249180a622b1d17c18354b38dc62172008663a9c9adf16d88bc4bb
end
