class Pythonrs < Formula
  desc "Compiled Python runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/pythonrs"
  license "MIT"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.15/pythonrs-v0.1.15-aarch64-apple-darwin-bundled.tar.gz"
      sha256 "ea71455bf40719d21c2a9550f6dd874604851237953874e18bb109520a23da42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.15/pythonrs-v0.1.15-x86_64-unknown-linux-gnu-bundled.tar.gz"
      sha256 "a8cf446d423ceffb7569d6de0c517a8581d7dc3286e6c818c955722aac6664be"
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
