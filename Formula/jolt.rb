class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  version "0.1.0"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.0/joltc-v0.1.0-aarch64-macos.tar.gz"
      sha256 "cd4996e7961808e13f263f83b81b07455fced7ff05d46575bdc15756cd40e055"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.0/joltc-v0.1.0-x86_64-linux.tar.gz"
      sha256 "aa7c265d41c5b8178a3eebcd33fd2ca753de6730996d663365224acdd1d9b81b"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
