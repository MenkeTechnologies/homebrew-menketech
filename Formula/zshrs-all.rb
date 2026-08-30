class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-aarch64-apple-darwin.tar.gz"
      sha256 "52d4f84847b146b64598f070cf71603b6a4bc0250f35faef1ab72e2dc2118025"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-x86_64-apple-darwin.tar.gz"
      sha256 "e3f4977d47a4e339c5d066b70d6037f78c7d5ea23ccd5e8ee4ac24cfe0331b07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9758308b9be44af7cff77213cbefa25d9fe33f784671073f83967425e32535f8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.46/zshrs-all-v0.12.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0fb1a236baa0784b743a16159701f9dbe88be53c20ef16a462fade27aa011bf"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.12.46-x86_64-unknown-linux-musl.tar.gz  sha256: 38620719ee7356e5363516b4dd251e0e48fda9281a243d4beb230681aa194850
  #   zshrs-all-v0.12.46-aarch64-unknown-linux-musl.tar.gz  sha256: 714ce16d9c31f52a13560f51450ecc323a80097000e24768fac2c28df0b7a0c2
end
