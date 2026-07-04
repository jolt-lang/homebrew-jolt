class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.6/joltc-v0.1.6-aarch64-macos.tar.gz"
      sha256 "47753300d8a852940ab6c54bed9228bab946627468f7b6fde209794135c771a8"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.6/joltc-v0.1.6-x86_64-linux.tar.gz"
      sha256 "fd62b46f53e9027605bbc56b91386469e664c3026877b5a3deceef819638be6c"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
