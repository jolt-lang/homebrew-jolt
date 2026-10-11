class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.21/jolt-v0.8.21-aarch64-macos.tar.gz"
      sha256 "d68c202c325dc9464a1122f20d070a5bd0b286814ac0c61a209dd4599d2b3d6d"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.21/jolt-v0.8.21-x86_64-linux.tar.gz"
      sha256 "0efac3675c264b2e9b989b4242c24d0187a2e085f0f1f5cd889d71d8d45c2f3c"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
