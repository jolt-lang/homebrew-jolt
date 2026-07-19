class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.6/joltc-v0.4.6-aarch64-macos.tar.gz"
      sha256 "77ffab3be729c0148ab3eae61031a664be53281970fd038f2ad8d79015b3866e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.6/joltc-v0.4.6-x86_64-linux.tar.gz"
      sha256 "2b5d4adc5fec2c9d311a7c1399934858df26d9d23d12b317f7c4cb6fb11e1f82"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
