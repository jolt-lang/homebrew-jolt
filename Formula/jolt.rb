class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.3/joltc-v0.2.3-aarch64-macos.tar.gz"
      sha256 "9c46efba484abe4b4085802f986bc592543e5542019636768e981f727f41b0f9"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.3/joltc-v0.2.3-x86_64-linux.tar.gz"
      sha256 "ab3e81d96b573728c3d5fd52219dbbcde0748c6757a6a8a0175a04997bc749ab"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
