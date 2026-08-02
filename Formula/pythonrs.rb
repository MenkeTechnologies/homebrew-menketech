class Pythonrs < Formula
  desc "Compiled Python runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/pythonrs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.0/pythonrs-v0.1.0-aarch64-apple-darwin-bundled.tar.gz"
      sha256 "95fea3089192e008eccb1d975482e729ea7288768aafd7e5d8d4f4f33eb19341"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.0/pythonrs-v0.1.0-x86_64-unknown-linux-gnu-bundled.tar.gz"
      sha256 "8f74e85cd8a3e897d4c3813ebc397836b94b3337f204976bc1769dd84e4f7184"
    end
  end

  def install
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/python"
  end

  test do
    assert_match "42", shell_output("#{bin}/python -c 'print(6*7)'")
    (testpath/"t.py").write("import hashlib\nprint(hashlib.sha256(b'x').hexdigest()[:8])\n")
    assert_match "2d711642", shell_output("#{bin}/python #{testpath}/t.py")
  end
end
