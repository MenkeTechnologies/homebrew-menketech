class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.9.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.1/lsofrs-v4.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "e38d55b5c753e8b53fb52f785547e1dee27b4e716b0cf989ee1166e279fbbbd2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.1/lsofrs-v4.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "b9fa181bd8402f3a7447d21a48a8ef673f6bcdcd6439d9af39443ba9627c4de5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.1/lsofrs-v4.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc210e9ef73a5eebd11075a27f530e1eda5731c0e38d9da11b9f1661c678be55"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.1/lsofrs-v4.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef3a51365b00cc4cf38efe9c39001c4a3820fd15deb17ad3bd2f219d6b0081fe"
    end
  end

  def install
    bin.install "lsofrs"
    bin.install "lsf"
  end

  test do
    assert_match "lsofrs", shell_output("#{bin}/lsf --version")
  end

  # Static musl tarballs also published at this release:
  #   lsofrs-v4.9.1-x86_64-unknown-linux-musl.tar.gz  sha256: 9256244ea08a3a3fd94d49c6eab11d25cc6ecf8e08de59cc5c488a7acf5bf49b
  #   lsofrs-v4.9.1-aarch64-unknown-linux-musl.tar.gz  sha256: d4c25bd0f51d1bb4efa99cb89ab145b9a2366e5aadd184a2f560d332a4f64e6d
end
