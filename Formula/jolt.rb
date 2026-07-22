class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.15/joltc-v0.4.15-aarch64-macos.tar.gz"
      sha256 "2f56b2ae6e11faf104afbf0d64afc42b073ae81bb7da6993c1e1756096f451b2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.15/joltc-v0.4.15-x86_64-linux.tar.gz"
      sha256 "90d7be25b506f534f52086944353ba39c9f499022b20f57ed5992ada98c2ad7a"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
