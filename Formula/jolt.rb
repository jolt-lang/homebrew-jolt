class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.2/jolt-v0.7.2-aarch64-macos.tar.gz"
      sha256 "9a4b1bb9042c6b549cb83b7e4c5eb0e987dcc7165be61da9f526ff619590ba8a"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.2/jolt-v0.7.2-x86_64-linux.tar.gz"
      sha256 "84f43244b6a9883ff67ab1c41f34f4628150f387b3771327bf86fa9881870d24"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
