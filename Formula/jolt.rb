class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.8/jolt-v0.6.8-aarch64-macos.tar.gz"
      sha256 "66ae1db092003b73e52c31d04db5ef160c6e4fe17f7e3cc9a42210428aa9720b"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.8/jolt-v0.6.8-x86_64-linux.tar.gz"
      sha256 "81566e27ee056b54eb598073dece4cfae1f06bfd45b3f996eac169465fb7ff27"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
