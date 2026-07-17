class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.0/joltc-v0.4.0-aarch64-macos.tar.gz"
      sha256 "a3d15b92335fab3b50c05f96312daa8e40bc2cd61f0cf960bd0c155cf260acc4"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.0/joltc-v0.4.0-x86_64-linux.tar.gz"
      sha256 "a02a8cd63b683d72ba92334b34378d8b06b452b62b65fa933567c3f457b57dab"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
