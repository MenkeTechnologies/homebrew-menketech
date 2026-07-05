class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.12/temprs-v2.9.12-aarch64-apple-darwin.tar.gz"
      sha256 "f21332841bb22222d5bfad6c36dd800394bd0ed05ca86be8e94eed1ee903c762"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.12/temprs-v2.9.12-x86_64-apple-darwin.tar.gz"
      sha256 "f3708592a968dac57bc18b07ef0eefdc062943bc0be93d05c3adb912652d2984"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.12/temprs-v2.9.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cefb7627f8279abfc9ca0bf66633bd7fc5f53022bbb3de075a648c43829a9df1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.12/temprs-v2.9.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "943dbd75f2e91492b7f1a6e99ccd5bcf3595b5e9d80d8080cf6f5390dff8c93d"
    end
  end

  def install
    bin.install "temprs"
    bin.install "tp"
  end

  test do
    assert_match "temprs", shell_output("#{bin}/temprs --version")
  end

  # Static musl tarballs also published at this release:
  #   temprs-v2.9.12-x86_64-unknown-linux-musl.tar.gz  sha256: bbd14c4de180331d14aeec0bf93e653f87d048cfe57a820831bfab0b9d4b7f31
  #   temprs-v2.9.12-aarch64-unknown-linux-musl.tar.gz  sha256: fc7fb0c368100b24ff44c74168a549506678599046f59c0c6f6bc3f6053e6e5d
end
