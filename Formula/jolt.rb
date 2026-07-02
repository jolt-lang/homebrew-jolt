class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  version "0.1.1"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.1/joltc-v0.1.1-aarch64-macos.tar.gz"
      sha256 "b849ac2a4144aacec57cc4e03b01a6096dbf859d3e6b4a13e781a0ace0128c99"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.1/joltc-v0.1.1-x86_64-linux.tar.gz"
      sha256 "2afb1c7141f15bc31db8eccde3aca60f2e67b1785ee9f415374d5dc6bba8b7fe"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
