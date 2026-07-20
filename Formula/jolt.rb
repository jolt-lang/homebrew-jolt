class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.10/joltc-v0.4.10-aarch64-macos.tar.gz"
      sha256 "032a076e7f89c4030a5c0cbadae4a11964c7a6e73777b5be7d484300da55d0af"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.10/joltc-v0.4.10-x86_64-linux.tar.gz"
      sha256 "8626c9bc26e61d25373d5d3ad5d1cab370e24397f036baf92ffb3a4bb899d771"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
