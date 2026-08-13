class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.7/jolt-v0.7.7-aarch64-macos.tar.gz"
      sha256 "98c071212b60df0a3c7b49be8111000b6e598a0a3a3d3835e468166106703d4c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.7/jolt-v0.7.7-x86_64-linux.tar.gz"
      sha256 "d817b40fab9bd15f4a67b2c66ae857e8f36085b3674d767acef6c5394c01f665"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
