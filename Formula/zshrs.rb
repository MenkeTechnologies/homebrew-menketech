class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-v0.13.27-aarch64-apple-darwin.tar.gz"
      sha256 "80c3a31bdca6f1ba2f299a3d99c893e0d58539f8559f3fca359d0530620799b3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-v0.13.27-x86_64-apple-darwin.tar.gz"
      sha256 "55c3df894bbd3abe41b2c0a57557fe8e54da816781cab096c41f7275a456a56f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-v0.13.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62502c3d21e52c20b331b90ac7e302a1c21d0b6a4d066ed9c9db84ea69f12cb1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.27/zshrs-v0.13.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4fe3ca9286086faeaff0413e55cec2abc388b88c543aa12e3315e914501bf8a"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.27-x86_64-unknown-linux-musl.tar.gz  sha256: 15b24b9149fff160419309df2bfe327f99359cbc38c8f1b738dcabfc8b909602
end
