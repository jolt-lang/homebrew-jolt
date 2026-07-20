class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.8/joltc-v0.4.8-aarch64-macos.tar.gz"
      sha256 "4baea6904d6758b420c16ba68d882d77cfde0d9ebb2c4b1d1e57ed58702097be"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.8/joltc-v0.4.8-x86_64-linux.tar.gz"
      sha256 "c5e4a1ff5edf83730878da21378f3f6f6f0cb1027ecce48bb9ac8bda0fe857d1"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
