class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.12/joltc-v0.4.12-aarch64-macos.tar.gz"
      sha256 "06074203e9702ebc18d4be474639e16f12e803671beeddbc13e7543243b6fb9e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.12/joltc-v0.4.12-x86_64-linux.tar.gz"
      sha256 "83b86dadae7743d3f6d64135943853b66c96053197e34da2b6efdfe7e3777854"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
