class Pythonrs < Formula
  desc "Compiled Python runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/pythonrs"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.10/pythonrs-v0.1.10-aarch64-apple-darwin-bundled.tar.gz"
      sha256 "ab3a6c0b077da54590c522188f3fa4d70eb56247b74a58197d1627f01ebe9e2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.10/pythonrs-v0.1.10-x86_64-unknown-linux-gnu-bundled.tar.gz"
      sha256 "52a01ccdaec7a6baecbcbd247154b3d1203af08a6b85f0fb88554940bb5eb7b6"
    end
  end

  def install
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/python"
  end

  def post_install
    home = File.expand_path("~/.pythonrs")
    mkdir_p home
    ["bin", "lib"].each do |d|
      rm_rf "#{home}/#{d}"
      cp_r "#{libexec}/#{d}", home
    end
  end

  test do
    assert_equal "42", shell_output("#{bin}/python -c 'print(6*7)'").strip
    (testpath/"t.py").write("import hashlib\nprint(hashlib.sha256(b'x').hexdigest()[:8])\n")
    assert_equal "2d711642", shell_output("#{bin}/python #{testpath}/t.py").strip
  end
end
