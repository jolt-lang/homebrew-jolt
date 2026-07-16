class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.3/joltc-v0.3.3-aarch64-macos.tar.gz"
      sha256 "3377811552e10aa606c62525136d53fd93d31c655f9f9a52c54f0d9524ad2544"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.3/joltc-v0.3.3-x86_64-linux.tar.gz"
      sha256 "18f36dab8f5c6b880a218e5e2433a9ecdcdd91ee2bdb5d8782b09778e75bfaa4"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
