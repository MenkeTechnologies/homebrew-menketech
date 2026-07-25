class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.8.0/zdbview-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "744b748404404d5d917c6cbf6ac536d228b5120f12304b149f1fd15c5d700638"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.8.0/zdbview-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "786a9ec11aed4afb39c693c68a9ebcc2ddf0a487662fbc08f9edc2103b3dd1ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.8.0/zdbview-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f113a0a2c2b72ac9cd9381a5d73e7b92f924b3975f8df4ca213017f3240e107"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.8.0/zdbview-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc938a4762902037d7eceaadcdfe7dfe0626c8dece669d564e17358f4638ed0b"
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
  #   zdbview-v0.8.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: a4af5e6dd54e065a8522a37034292c2a922ec43a4f0fa162ab424fc428438229
  #   zdbview-v0.8.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 89f97f37431c1c6e83792dc0d21e31762c2088a3ba7cc22fd07155e84b3d61c6
end
