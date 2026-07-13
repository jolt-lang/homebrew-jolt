class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.7/joltc-v0.2.7-aarch64-macos.tar.gz"
      sha256 "2915acbb7f962b2a8e9d04452eb2692f3790af376db1de3ed5de19839b8ca7a2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.7/joltc-v0.2.7-x86_64-linux.tar.gz"
      sha256 "f3b1ea6bd87f82f9a267ba6f6636cec27fbcbbe87513b76b54064b49542b2120"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
