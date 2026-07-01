class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  version "0.1.0"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.0/joltc-v0.1.0-aarch64-macos.tar.gz"
      sha256 "abc4bb17c28ba7ea71c1d314eec3a46167852c5016c329c4e33ffd8c87657bc8"
    end
    # Intel macOS added once its release build publishes (slow GitHub runner).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.0/joltc-v0.1.0-x86_64-linux.tar.gz"
      sha256 "f7d0e69f726e8638122caa3b98c61177c610b790389998ca4a5648d8435421fe"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
