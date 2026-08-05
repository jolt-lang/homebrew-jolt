class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.3/jolt-v0.6.3-aarch64-macos.tar.gz"
      sha256 "6e8cf200e42564e3f8899b08d1822c2739730e109ea16b199545bfe9e66f37ea"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.3/jolt-v0.6.3-x86_64-linux.tar.gz"
      sha256 "6bb477aca0c14d948e62b3c37df40831d6578ede25c4d54c9db2e7c8bfde3f5c"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
