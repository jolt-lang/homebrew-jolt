class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.2/joltc-v0.2.2-aarch64-macos.tar.gz"
      sha256 "3e0a679631ddfbc4b7b83a7786055fe62fa8a8ea49e518a2f68717bc0626df6c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.2/joltc-v0.2.2-x86_64-linux.tar.gz"
      sha256 "6574cc2cf748b0ff7822e3833070177ff0bc5f06a89eaaf1d15aa4efdf5a389c"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
