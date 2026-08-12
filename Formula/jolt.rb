class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.4/jolt-v0.7.4-aarch64-macos.tar.gz"
      sha256 "772cbb8eaaa12a864a54e96d883eb3e81392dc4196a0ebf47e198445c34c8d7a"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.4/jolt-v0.7.4-x86_64-linux.tar.gz"
      sha256 "7d8b2f459a7128507935503608321381994829656d08bc5b13cdc58901e7af9b"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
