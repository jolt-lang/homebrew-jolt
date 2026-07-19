class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.4/joltc-v0.4.4-aarch64-macos.tar.gz"
      sha256 "3dd2ffde7942c12c2b7888d29170db16a133d2b3797741a6fa0a28577ca2d5d3"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.4/joltc-v0.4.4-x86_64-linux.tar.gz"
      sha256 "b68d9778d258a7c1b8406573b867899a772346ec21b77b8abd6807a50fda86c2"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
