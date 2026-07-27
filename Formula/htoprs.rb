class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "MIT"
  version "0.5.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.10/htoprs-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "7e89895368e8de4f5c8a85f54aa55066acf1a0cdb7eff9f108c1bc42c1f99aca"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.10/htoprs-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "8b7ed6c287e6045857fadb85f7f6dbda97e21b512075226ba09fa6475a5e6b3c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.10/htoprs-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "162b3bb96e46f40b71bf5eb4fa5a7600bcc91ac9a9a36ae526787671de1b3403"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.10/htoprs-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b1e0d6ab6a150543292a9c76a156d93a7349854a473b0298ec97798d7048d95"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
