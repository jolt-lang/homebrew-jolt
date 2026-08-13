class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.9/jolt-v0.7.9-aarch64-macos.tar.gz"
      sha256 "31091a1bdfdb6334ae78c6a9653b1ea8318eb1311494ea19d9f2f5d4e553437d"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.9/jolt-v0.7.9-x86_64-linux.tar.gz"
      sha256 "120ec0830b8de3bae6117dca99c9d1dff869e259e04cdb7bd7d7f2dfb21b0710"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
