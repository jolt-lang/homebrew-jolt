class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.7/joltc-v0.4.7-aarch64-macos.tar.gz"
      sha256 "aec0fca3e449b949842fcc3231be42e538cfb7659926af16ddd0d0a6e9d3c4b7"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.7/joltc-v0.4.7-x86_64-linux.tar.gz"
      sha256 "d086c407479d88c35a23240c24741f0bcbea3d4cbe4ea87ffa202778252a9006"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
